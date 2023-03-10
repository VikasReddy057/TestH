/*
@Author : Biswajeet Samal
@CreatedDate : 30th JUL 2020
@Description : Google ReCAPTCHA Controller
*/
public class GoogleReCAPTCHAController {
     
    public Boolean verified { get; private set; }
    public String response  { 
        get {
            return ApexPages.currentPage().getParameters().get('g-recaptcha-response');
        }
    }
    public String firstName{get;set;}
    public String lastName{get;set;}
    public String publicKey {get;set;}
     
    private String remoteHost{
        get {
            String ret = '127.0.0.1';
            //Also could use x-original-remote-host
            Map<String, String> hdrs = ApexPages.currentPage().getHeaders();
            if (hdrs.get('x-original-remote-addr')!= null)
                ret = hdrs.get('x-original-remote-addr');
            else if (hdrs.get('X-Salesforce-SIP')!= null)
                ret = hdrs.get('X-Salesforce-SIP');
            return ret;
        }
    }
     
    //Google Secret Key
    private static String secretKey = 'ADD YOUR GOOGLE RECAPTCHA SECRET KEY';
    private static String baseUrl = '<a class="vglnk" href="https://www.google.com/recaptcha/api/siteverify" rel="nofollow"><span>https</span><span>://</span><span>www</span><span>.</span><span>google</span><span>.</span><span>com</span><span>/</span><span>recaptcha</span><span>/</span><span>api</span><span>/</span><span>siteverify</span></a>';
     
    //Constructor
    public GoogleReCAPTCHAController(){
        this.publicKey = 'ADD YOUR GOOGLE RECAPATCHA SITE KEY OR PUBLIC KEY';//Google Site Key or Public Key
        this.verified = false;
    }
     
    public PageReference submit(){
        if (response == null ){
            //Google recaptcha empty response
            return null;
        }
        HttpResponse res = getGoogleReCAPTCHAResponse(baseUrl,'secret=' + secretKey + '&remoteip=' + remoteHost + '&response=' + response);
        if (res != null ) {
            JSONParser parser = JSON.createParser(res.getBody());
            while (parser.nextToken() != null) {
                if ((parser.getCurrentToken() == JSONToken.FIELD_NAME) && (parser.getText() == 'success')) {
                    parser.nextToken();
                    this.verified = parser.getBooleanValue();
                    break;
                }
            }            
        }   
        if(this.verified){
            //Add your logic
            return null;
        }
        else{
            //Stay on page to re-try reCAPTCHA
            return null;
        }
    }
     
    //Get Google reCAPTCHA Service Response 
    private static HttpResponse getGoogleReCAPTCHAResponse(string requestURL, string body){
        HttpResponse response = null;
        HttpRequest req = new HttpRequest();
        req.setEndpoint(requestURL);
        req.setMethod('POST');
        req.setBody (body);
        try{
            Http http = new Http();
            response = http.send(req);
            System.debug('ReCAPTCHA Response-' + response);
            System.debug('ReCAPTCHA Body-' + response.getBody());
        }
        catch(System.Exception ex){
            System.debug('ERROR Message-' + ex.getMessage());
        }
        return response;
    }
}
public class CalloutClass {
	@future(Callout = true)
    public static void makeCallout(){
         HttpRequest request = new HttpRequest();
        // Set the endpoint URL.
        String endpoint = 'https://jsonplaceholder.typicode.com/todos/1';
        request.setEndPoint(endpoint);
        // Set the HTTP verb to GET.
        request.setMethod('POST');
        // Send the HTTP request and get the response.
        HttpResponse response = new HTTP().send(request);
        system.debug('This is test');
    }
}
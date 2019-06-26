import javax.net.ssl.HttpsURLConnection;
import java.net.URL;
import java.io.BufferedReader;
import java.io.InputStreamReader;

public class tls {

	/**
	 * Tests whether this client can make an HTTP connection with TLS 1.2.
	 *
	 * @return true if connection is successful. false otherwise.
	 */
	public static boolean isSuccessfulTLS12Connection() {
		try {
			URL url = new URL("https://tls.testegerencianet.com.br/");
			HttpsURLConnection httpsConnection = (HttpsURLConnection) url.openConnection();
			httpsConnection.addRequestProperty("User-Agent", "Mozilla/5.0 (Windows NT 6.1; WOW64; rv:25.0) Gecko/20100101 Firefox/25.0");
      httpsConnection.setRequestMethod("GET");

			int status = httpsConnection.getResponseCode();

			BufferedReader reader = new BufferedReader(new InputStreamReader(httpsConnection.getInputStream()));
			String input;
			StringBuffer body = new StringBuffer();
			while ((input = reader.readLine()) !=null) {
				body.append(input);
			}
			httpsConnection.disconnect();

			if (body.toString().equals("Gerencianet_Connection_TLS1.2_OK!") && status == 200) {
				return true;
			}

		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		return false;
	}

	public static void main(String[] args) {
		if (isSuccessfulTLS12Connection()) {
			System.out.println("Successfully connected to TLS 1.2 endpoint.");
		} else {
			System.out.println("Failed to connect to TLS 1.2 endpoint.");
		}
	}
}
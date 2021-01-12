package maxpresentation;
import java.sql.*;
import java.util.Scanner;
import java.io.*;
import java.util.Calendar;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.regex.Pattern;

public class GetPresentation 
{
	public static void main(String[] args) throws SQLException, IOException, ClassNotFoundException, IllegalAccessException, InstantiationException 
	{
		String [] dbSourceServer = {"MAXIDEV3","MAXITRAI","MAXIUAT","MAXITST2","MAXIDEV1"};
		String dbTargetServer = args[0];
		String fileXml = args[1];   
		String maxprop = args[2];
		String driver = args[3];
		// String user = args[4];
		// String password = args[5];
		String moveXml = args[4];
		String freeform = args[5];
		String text = new String();
		String urlSource = new String();
		String url = null;
		File fileProperties = new File(maxprop);
		// initialize the scanner
		Scanner scan = new Scanner(fileProperties);
		while(scan.hasNextLine())
		{
			String urltmp = scan.findInLine("mxe.db.url=");
			if(urltmp != null)
			{
				url = scan.next();
				url.replace("integratedSecurity=false", "integratedSecurity=true");
			}
			scan.nextLine();
		}
		scan.close();
		String filePath = "C:\\DBC\\Presentation\\" + fileXml + "_" + CurrentDate() + ".xml";
		
		try 
		{
			    //Class.forName(driver).newInstance();
		        Connection connSource = DriverManager.getConnection(url);
		        String sql = "SELECT presentation FROM MAXPRESENTATION WHERE app = '" + fileXml + "'";
		        Statement statement = connSource.createStatement();
		        ResultSet result = statement.executeQuery(sql);
		        String header = CreateHeader(fileXml);
		        String footer = CreateFooter();
		        String headerff = CreateHeaderFreeform(fileXml);
		        String footerff = CreateFooterFreeform();
		        while (result.next()) 
		        {
		        	if(freeform == "n")
		        	{
		        		text = header + result.getString("presentation") + "\r\n" + footer;
		        	}
		        	else
		        	{
		        		text = headerff + result.getString("presentation") + "\r\n" + footerff;
		        	}
		            byte[] inputText = text.getBytes();
		            try (FileOutputStream fos = new FileOutputStream(filePath)) {
		            	   fos.write(inputText);
		            	}
		        }
		        for(String server : dbSourceServer)
		        {
		        	if(url.contains(server))
		        	{
		        		url.replace(server, dbTargetServer);
		        	}
		        }	        
		}
		finally 
		{
			if (moveXml == "y")
			{
				Connection connTarget = DriverManager.getConnection(url);
				String sql = "UPDATE MAXPRESENTATION set presentation=" + text + "WHERE app = '" + fileXml + "'";
		        PreparedStatement statement = connTarget.prepareStatement(sql);
		        int result = statement.executeUpdate(); 
				
			}
		}	 
	}
	private static String CurrentDate()
	{
		Calendar calobj = Calendar.getInstance();
		DateFormat df = new SimpleDateFormat("mm-dd-yyyy");
		String cd = df.format(calobj.getTime());
		return cd;
	}
	private static String CreateHeader(String app)
	{
		String currentDate = CurrentDate();
		String header = "<?xml version=\"1.0\" encoding=\"UTF-8\"?>\r\n" + 
				"<!DOCTYPE script SYSTEM \"script.dtd\">\r\n" + 
				"<script author=\"GetPresentation app\" scriptname=\"Inserts into MAXPRESENTATION - " + app + " \">\r\n" + 
				"  <description>GetPresentation created this script at " + currentDate + " </description>\r\n" + 
				"  <statements>\r\n" + 
				"  <!--\r\n";
		return header;
	}
	
	private static String CreateHeaderFreeform(String app)
	{
		String currentDate = CurrentDate();
		String header = "<?xml version=\"1.0\" encoding=\"UTF-8\"?>\r\n" + 
				"<!DOCTYPE script SYSTEM \"script.dtd\">\r\n" + 
				"<script author=\"GetPresentation app\" scriptname=\"Inserts into MAXPRESENTATION - " + app + " \">\r\n" + 
				"  <description>GetPresentation created this script at " + currentDate + " </description>\r\n" + 
				"  <statements>\r\n" + 
			  	"<freeform description=\"Delete the values from suitable Tables\">\r\n" +
				"<sql target=\"all\">";
		return header;
	}
	
	private static String CreateFooter()
	{
		String footer = "  -->\r\n" + 
				"    </statements>\r\n" + 
				"</script>";
		return footer;
	}
	private static String CreateFooterFreeform()
	{
		String footer = "</sql>\r\n" + 
				"	</freeform>\r\n" + 
				"    </statements>\r\n" + 
				"</script>";
		return footer;
	}
}

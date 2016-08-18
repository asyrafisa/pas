/**
 * Edited by SyasyaAzizan
 * May 2016
 */

package main;

import java.io.*;

public class SMSService {
    
    private static String textToSend, receiver, host;
    private int port = 9500;
    private String username = "admin";
    private String password = "932473";
    
    public SMSService(String phone, String message, String hostAdd) {
        receiver = phone;
        textToSend = message;
        host = hostAdd;
        
        sending();
        System.out.println("--- End SMSService ---");
    }

    public void sending() 
    {
        System.out.println("--- Start SMSService ---");

        try
        {
            SMSClient smsClient = new SMSClient(host, port);
            smsClient.login(username, password);

            System.out.println("SMS message: ");
            
            if(smsClient.isLoggedIn())
            {
                System.out.println("SMSService login to Ozeki" + "\n");
                
                smsClient.sendMessage(receiver, textToSend);
                System.out.println("Send to : " + receiver + "\n" + "Message: " + textToSend);
                smsClient.logout();
            }
        } catch (IOException e)
        {
            System.out.println(e.toString());
            e.printStackTrace();
        } catch (InterruptedException e)
        {
            System.out.println(e.toString());
            e.printStackTrace();
        }
    }

}

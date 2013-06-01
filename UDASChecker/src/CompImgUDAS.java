/* --------------------------------------------------------- */
/* [IUGONET] CompImgUDAS.java                                */
/*                                                           */
/* NEW: ver.1.00. by N.UMEMURA, 20120529                     */
/* --------------------------------------------------------- */
package org.iugonet.main;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.Arrays;
import junit.framework.Test;
import junit.framework.TestCase;
import junit.framework.TestSuite;

import org.iugonet.define.DefineCompImgUDAS;

public class CompImgUDAS extends TestCase {


    // -------- DEFINE -------- //
    private static DefineCompImgUDAS DEFINE = null;
    private static boolean mBlnResult = true;

    // ---------------------------------------- //
    // [METHOD] main                            //
    // ---------------------------------------- //
    public static void main(String args[]) {
        junit.textui.TestRunner.run(suite());
    }

    // ---------------------------------------- //
    // [METHOD] suite                           //
    // ---------------------------------------- //
    public static Test suite() {
        return new TestSuite(CompImgUDAS.class);
    }

    // ---------------------------------------- //
    // [METHOD] setUp                           //
    // ---------------------------------------- //
    @Override
    protected void setUp() {

        // Message Out
        System.out.println("");
        System.out.println("---- [START] -----------------------------------------------");

        // Initialize
        DEFINE = new DefineCompImgUDAS();
        String strFileNameBase = new String("");
        String strFileNameNew  = new String("");
        File fileBase = null;
        File fileNew  = null;
        byte[] byteBase = null;
        byte[] byteNew  = null;
        boolean blnResult = true;
        int intSuccess    = 0;
        int intError      = 0;
        int intFatalError = 0;

        // Get File List (Base)
        File dir = new File(new String(DEFINE.DIR_IMAGE_NEW));
        File[] files = dir.listFiles();

        // Exec
        for (int i=0; i<files.length; i++) {

            // Message Out
            System.out.println("MESSAGE> Start the Comparison.");

            // Get File Name (String)
            strFileNameNew  = files[i].toString();
            strFileNameBase = DEFINE.DIR_IMAGE_BASE
                + strFileNameNew.substring(
                  strFileNameNew.lastIndexOf(DEFINE.DIR_SEPARATOR), strFileNameNew.length());
            System.out.println("MESSAGE> BaseFile = [" + strFileNameBase + "]");
            System.out.println("MESSAGE> NewFile  = [" + strFileNameNew  + "]");

            // Set File (File)
            fileBase = files[i];
            fileNew  = new File(strFileNameBase);

            try {
                // Convert to byte[]
                byteBase = new byte[(int)fileBase.length()];
                byteNew  = new byte[(int)fileNew.length()];
                new FileInputStream(strFileNameBase).read(byteBase);
                new FileInputStream(strFileNameNew).read(byteNew);
                // Compare
                blnResult = Arrays.equals(byteBase, byteNew);
                System.out.println("MESSAGE> Comparison Result ........ [" + blnResult + "]");
            }
            catch (FileNotFoundException e) {
                blnResult = false;
                intFatalError++;
                System.out.println("##ERROR> Base File Not Found. ErrorCode = [911]");
//              e.printStackTrace();
                continue;
            }
            catch (IOException e) {
                blnResult = false;
                intFatalError++;
                System.out.println("##ERROR> Cannot Read Base File. ErrorCode = [912]");
//              e.printStackTrace();
                continue;
            }
            finally {
                // Count Up
                if (blnResult == true) {
                    intSuccess++;
                }
                else if (blnResult == false) {
                    intError++;
                }
                // Initialize
                byteBase = null;
                byteNew  = null;
                // Message Out
                System.out.println("MESSAGE>");
            }

        } // End of for

        // Judge
        if (intSuccess != files.length) {
            mBlnResult = false;
        }

        // Message Out
        System.out.println("---- [DETAIL] ----------------------------------------------");
        System.out.println("#RESULT> TOTALNUMBER = [" + files.length + "]");
        System.out.print("#RESULT> ");
        System.out.print("SUCCESS = [" + Integer.toString(intSuccess) + "], ");
        System.out.print("ERROR = [" + Integer.toString(intError) + "], ");
        System.out.println("FATALERROR = [" + Integer.toString(intFatalError) + "]");
        if (mBlnResult == true) {
            System.out.println("#RESULT> " + DEFINE.MSG_NORMAL);
        }
        else if (mBlnResult == false) {
            System.out.println("#RESULT> " + DEFINE.MSG_ERROR);
        }
        System.out.println("---- [Message by JUnit]-------------------------------------");
    }

    // ---------------------------------------- //
    // [METHOD] testEquals                      //
    // ---------------------------------------- //
    public void testEquals() {
        assertTrue(mBlnResult);
    }

}

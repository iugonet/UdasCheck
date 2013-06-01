/* --------------------------------------------------------- */
/* [IUGONET] DefineCompImgUDAS.java                          */
/*                                                           */
/* NEW: ver.1.00. by N.UMEMURA, 20120529                     */
/* --------------------------------------------------------- */
package org.iugonet.define;

import java.io.File;

public final class DefineCompImgUDAS {

    // -------- DEFINE -------- //
    public String PATH = null;
    public String DIR_IMAGE_BASE = null;
    public String DIR_IMAGE_NEW  = null;
    private final String DIR_SRC = new String("src");
    private final String DIR_IMG = new String("images");
    private final String DIR_IMG_BASE = new String("base");
    private final String DIR_IMG_NEW  = new String("new");
    public  final String DIR_SEPARATOR = new String("/");

    public final String MSG_NORMAL = new String("All Test Passed.");
    public final String MSG_ERROR  = new String("Error Occurred!");


    // ---------------------------------------- //
    // [CONSTRUCTOR] DefineCompImgUDAS          //
    // ---------------------------------------- //
    public DefineCompImgUDAS() {
 
        // Get Current Directory
        File currentDir = new File("");
        PATH = currentDir.getAbsolutePath();
        PATH = PATH.substring(0, PATH.lastIndexOf(DIR_SEPARATOR + DIR_SRC));

        // Create PATH
        DIR_IMAGE_BASE = PATH + DIR_SEPARATOR + DIR_IMG + DIR_SEPARATOR + DIR_IMG_BASE;
        DIR_IMAGE_NEW  = PATH + DIR_SEPARATOR + DIR_IMG + DIR_SEPARATOR + DIR_IMG_NEW;

    }

}
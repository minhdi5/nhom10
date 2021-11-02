<?php
    /**
     * Đối với Windows Version PHP >= 7.3.1
     * Đối với Linux Version PHP >= 7.0.33
     * 
     * Minh họa xữ lí của project
     * 
     *  [CLIENT]    --------------
     *                           |      (.htaccess) -> App.php
     *                           |
     *                         Route    (Core/Route.class.php)  (Config/Route.config.php)
     *                           |
     *                           |
     *                           |
     *                   Proccess sử dụng lambda hoặc Func::call_empty... 
     *                      |    |   
     *                      |    |
     *         Model---------    ------------------------- --------(View::render)  (View.class.php)
     *           |                          (View::bind_data)         |     
     *           |                                                    |  (Data)
     *       Database (Database.class.php)                            |  (Xữ lí các mẫu code sang php)
     *           |                                                    |   Lây dữ liệu từ model qua PHP:     View::$DATA[name]
     *           |                                                    |                            Code mẫu:    @Data:name
     *           |                                                    |
     *           |                                                  View (Template Code) (Xem mô tả sử dụng code mẫu tại View.class.php)
     *          DPO-----MySQL
     * 
     * 
     * 
     * 
     * Vào "Config/Route.config.php" cấu hình path cho controller
     * 
     * Vào "Config/DB.config.php" cấu hình database
     * 
     * 
     * 
     * 
     * 
     */


    include_once "Config/Global.config.php";
    

    /**
     * Kiểm tra version php
     */
    $OS = php_uname('a');
    $PHPVERSION = phpversion();

    if (version_compare($PHPVERSION, $MIN_VER_PHP, '<')) {
        echo "<br>PHP: $PHPVERSION";
        echo "<br>OS: $OS";
        echo "<br>Vui lần sử dụng Version PHP >= $MIN_VER_PHP!";
        echo "<br>Nếu bạn đang sử dụng máy chủ 'không phải cục bộ' hãy thự hạ nó xuống >= 7.0.33 nó sẽ làm việc!";
        exit;
    }



    /**
     * Setup pcre regexp
     */
    ini_set('pcre.backtrack_limit',1000000);
    ini_set('pcre.recursion_limit',1000000);
    

    /**
     * DEBUG var_dump full
     */
    ini_set("xdebug.var_display_max_children", -1);
    ini_set("xdebug.var_display_max_data", -1);
    ini_set("xdebug.var_display_max_depth", -1);

    /**
     * Warning to error
     */
    set_error_handler(function ($err_severity, $err_msg, $err_file, $err_line, array $err_context)
    {
        throw new ErrorException( $err_msg, 0, $err_severity, $err_file, $err_line );
    }, E_WARNING);


    
    include_once "Core/Database.class.php";
    include_once "Core/Session.class.php";
    include_once "Core/Cookie.class.php";
    include_once "Core/Javascript.class.php";
    include_once "Core/Function.class.php";
    include_once "Core/Route.class.php";
    include_once "Core/View.class.php";
    include_once "Controller/Base.controller.php";


    /**
     * Fix lỗi đường dẫn windows
     */
    Route::fixPathWindows();

    /**
     * Cấu hình route trong file Route.config.php
     */
    include_once dirname(__FILE__)."/Config/Route.config.php";
    Route::config($ROUTES);

?>

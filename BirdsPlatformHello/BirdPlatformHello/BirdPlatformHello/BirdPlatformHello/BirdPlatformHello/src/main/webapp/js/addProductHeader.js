/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */


            //            ACCOUNT MENU TOGGLE
                        function menuToggle() {
                            const  toggleMenu = document.querySelector('.account-menu');
                            toggleMenu.classList.toggle('active');
                        }
                        // SIDEBAR TOGGLE

                        var sidebarOpen = false;
                        var sidebar = document.getElementById("sidebar");
                        function openSidebar() {
                            if (!sidebarOpen) {
                                sidebar.classList.add("sidebar-responsive");
                                sidebarOpen = true;
                            }
                        }
                        function closeSidebar() {
                            if (sidebarOpen) {
                                sidebar.classList.remove("sidebar-responsive");
                                sidebarOpen = false;
                            }
                        }


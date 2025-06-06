<%-- 
    Document   : preloader
    Created on : Apr 21, 2025, 12:51:27 PM
    Author     : Madelyn Yap
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Preloader | Fithub </title>
        <style>
            .loader {
              display: block;
              width: 150px;
              height: auto;
              margin: 100px auto;
            }

            .loader_body,
            .loader_front,
            .loader_handlebars,
            .loader_pedals,
            .loader_pedals-spin,
            .loader_seat,
            .loader_spokes,
            .loader_spokes-spin,
            .loader_tire {
              animation: bikeBody 3s ease-in-out infinite;
              stroke: var(--primary, #14b8a6);
              transition: stroke var(--trans-dur, 0.3s);
            }

            .loader_front { animation-name: bikeFront; }
            .loader_handlebars { animation-name: bikeHandlebars; }
            .loader_pedals { animation-name: bikePedals; }
            .loader_pedals-spin { animation-name: bikePedalsSpin; }
            .loader_seat { animation-name: bikeSeat; }
            .loader_spokes { animation-name: bikeSpokes; stroke: currentColor; }
            .loader_spokes-spin { animation-name: bikeSpokesSpin; }
            .loader_tire { animation-name: bikeTire; stroke: currentColor; }

            @keyframes bikeBody {
              from { stroke-dashoffset: 79; }
              33%, 67% { stroke-dashoffset: 0; }
              to { stroke-dashoffset: -79; }
            }

            @keyframes bikeFront {
              from { stroke-dashoffset: 19; }
              33%, 67% { stroke-dashoffset: 0; }
              to { stroke-dashoffset: -19; }
            }

            @keyframes bikeHandlebars {
              from { stroke-dashoffset: 10; }
              33%, 67% { stroke-dashoffset: 0; }
              to { stroke-dashoffset: -10; }
            }

            @keyframes bikePedals {
              from {
                animation-timing-function: ease-in;
                stroke-dashoffset: -25.133;
              }
              33%, 67% {
                animation-timing-function: ease-out;
                stroke-dashoffset: -21.991;
              }
              to { stroke-dashoffset: -25.133; }
            }

            @keyframes bikePedalsSpin {
              from { transform: rotate(0.1875turn); }
              to { transform: rotate(3.1875turn); }
            }

            @keyframes bikeSeat {
              from { stroke-dashoffset: 5; }
              33%, 67% { stroke-dashoffset: 0; }
              to { stroke-dashoffset: -5; }
            }

            @keyframes bikeSpokes {
              from {
                animation-timing-function: ease-in;
                stroke-dashoffset: -31.416;
              }
              33%, 67% {
                animation-timing-function: ease-out;
                stroke-dashoffset: -23.562;
              }
              to { stroke-dashoffset: -31.416; }
            }

            @keyframes bikeSpokesSpin {
              from { transform: rotate(0); }
              to { transform: rotate(3turn); }
            }

            @keyframes bikeTire {
              from {
                animation-timing-function: ease-in;
                stroke-dashoffset: 56.549;
                transform: rotate(0);
              }
              33% {
                stroke-dashoffset: 0;
                transform: rotate(0.33turn);
              }
              67% {
                animation-timing-function: ease-out;
                stroke-dashoffset: 0;
                transform: rotate(0.67turn);
              }
              to {
                stroke-dashoffset: -56.549;
                transform: rotate(1turn);
              }
            }
        </style>
    </head>
    <body>
        <div>
            <svg class="loader" viewBox="0 0 48 30" width="48px" height="30px">
                <g fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="1">
                    <g transform="translate(9.5,19)">
                        <circle class="loader_tire" r="9" stroke-dasharray="56.549 56.549"></circle>
                        <g class="loader_spokes-spin" stroke-dasharray="31.416 31.416" stroke-dashoffset="-23.562">
                            <circle class="loader_spokes" r="5"></circle>
                            <circle class="loader_spokes" r="5" transform="rotate(180,0,0)"></circle>
                        </g>
                    </g>
                    <g transform="translate(24,19)">
                        <g class="loader_pedals-spin" stroke-dasharray="25.133 25.133" stroke-dashoffset="-21.991" transform="rotate(67.5,0,0)">
                            <circle class="loader_pedals" r="4"></circle>
                            <circle class="loader_pedals" r="4" transform="rotate(180,0,0)"></circle>
                        </g>
                    </g>
                    <g transform="translate(38.5,19)">
                        <circle class="loader_tire" r="9" stroke-dasharray="56.549 56.549"></circle>
                        <g class="loader_spokes-spin" stroke-dasharray="31.416 31.416" stroke-dashoffset="-23.562">
                            <circle class="loader_spokes" r="5"></circle>
                            <circle class="loader_spokes" r="5" transform="rotate(180,0,0)"></circle>
                        </g>
                    </g>
                    <polyline class="loader_seat" points="14 3,18 3" stroke-dasharray="5 5"></polyline>
                    <polyline class="loader_body" points="16 3,24 19,9.5 19,18 8,34 7,24 19" stroke-dasharray="79 79"></polyline>
                    <path class="loader_handlebars" d="m30,2h6s1,0,1,1-1,1-1,1" stroke-dasharray="10 10"></path>
                    <polyline class="loader_front" points="32.5 2,38.5 19" stroke-dasharray="19 19"></polyline>
                </g>
            </svg>
        </div>
    </body>
</html>

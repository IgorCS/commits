<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<script type="text/javascript">
function finalizaAgora(id) {
$.get("finalizaTarefa?id=" + id);
}
</script>
<script type="text/javascript">
function finalizaDesc(id) {
$.get("finalizaDescricao?id=" + id);
}
</script>
<head>
<script type="text/javascript"
	src="resources/js/jquery.tablesorter.min.js"></script>
<script type="text/javascript" src="resources/js/jquery-1.3.2.min.js"></script>
<script type="text/javascript" src="resources/js/jquery-1.4.4.min.js"></script>
<script type="text/javascript" src="resources/js/jquery.js"></script>
<script type="text/javascript"
	src="resources/js/jquery.leanModal.min.js"></script>
<script type="text/javascript" src="resources/js/glow/1.7.0/core"></script>
<script type="text/javascript"
	src="http://gettopup.com/releases/latest/top_up-min.js"></script>
<title>tarefas</title>
<link rel="stylesheet" href="<c:url value="resources/css/960.css" />"
	type="text/css" media="screen" charset="utf-8" />


<link rel="stylesheet" href="<c:url value="resources/css/fluid.css" />"
	type="text/css" media="screen" charset="utf-8" />
<link rel="stylesheet"
	href="<c:url value="resources/css/thickbox.css" />" type="text/css"
	media="screen" charset="utf-8" />
<link rel="stylesheet"
	href="<c:url value="resources/css/template.css" />" type="text/css"
	media="screen" charset="utf-8" />
<link rel="stylesheet" href="<c:url value="resources/css/colour.css" />"
	type="text/css" media="screen" charset="utf-8" />

<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css" />
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>

<!-- PAGINAÇÂO GOLIMAR -->
<script type="text/javascript" src="resources/js/smartpaginator.js"></script>
<link rel="stylesheet"
	href="<c:url value="resources/css/smartpaginator.css" />"
	type="text/css" media="screen" charset="utf-8" />
<!-- Paginatione -->

<script type="text/javascript">
        $(document).ready(function () {
            $('#green-contents').css('display', 'none');
            $('#black-contents').css('display', 'none');
            $('ul li').click(function () {
                $('#red-contents').css('display', 'none');
                $('#green-contents').css('display', 'none');
                $('#black-contents').css('display', 'none');
                if ($(this).attr('id') == '1') $('#red-contents').css('display', '');
                if ($(this).attr('id') == '2') $('#green-contents').css('display', '');
                if ($(this).attr('id') == '3') $('#black-contents').css('display', '');
            });

            $('#green').smartpaginator({ totalrecords: 10, recordsperpage: 3, datacontainer: 'mt', dataelement: 'tr', initval: 0, next: 'Next', prev: 'Prev', first: 'First', last: 'Last', theme: 'green' });

            $('#black').smartpaginator({ totalrecords: 5, recordsperpage: 1, datacontainer: 'divs', dataelement: 'div', initval: 0, next: 'Next', prev: 'Prev', first: 'First', last: 'Last', theme: 'black' });

            $('#red').smartpaginator({ totalrecords: 32, recordsperpage: 4, length: 4, next: 'Next', prev: 'Prev', first: 'First', last: 'Last', theme: 'red', controlsalways: true, onchange: function (newPage) {
                $('#r').html('Page # ' + newPage);
            }
            });

        });
    </script>
    <style type="text/css">
        body
        {
            padding: 20px;
        }
        #wrapper
        {
            margin: auto;
            width: 800px;
        }
        .contents
        {
            width: 91%; /*height: 150px;*/
            margin: 0;
        }
        .contents > p
        {
            padding: 8px;
        }
        .table
        {
            width: 100%;
            border-right: solid 1px #5f9000;
        }
        .table th, .table td
        {
            width: 16%;
            height: 20px;
            padding: 4px;
            text-align: left;
        }
        .table th
        {
            border-left: solid 1px #5f9000;
        }
        .table td
        {
            border-left: solid 1px #5f9000;
            border-bottom: solid 1px #5f9000;
        }
        .header
        {
            background-color: #4f7305;
            color: White;
        }
        #divs
        {
            margin: 0;
            height: 200px;
            font: verdana;
            font-size: 14px;
            background-color: White;
        }
        #divs > div
        {
            width: 98%;
            padding: 8px;
        }
        #divs > div p
        {
            width: 95%;
            padding: 8px;
        }
        ul.tab
        {
            list-style: none;
            margin: 0;
            padding: 0;
        }
        ul.tab li
        {
            display: inline;
            padding: 10px;
            color: White;
            cursor: pointer;
        }
        #container
        {
            width: 100%;
            border: solid 1px red;
        }
    </style>
</head>
<body>
 <c:set value="2" var="pageSize"/>  
    <c:choose>  
        <c:when test="${empty param.s}">  
            <c:set var="rowStart" value="1"/>  
        </c:when>  
        
        <c:otherwise>  
            <c:set var="rowStart" value="${param.s}"/>  
        </c:otherwise>  
    </c:choose>  
    <c:choose>  
        <c:when test="${empty param.e}">  
            <c:set var="rowEnd" value="${pageSize}"/>  
        </c:when>  
        <c:otherwise>  
            <c:set var="rowEnd" value="${param.e}"/>  
        </c:otherwise>  
    </c:choose>  
    
    <div id="wrapper">
        <div style="height: 30px;">
            <ul class="tab">
                <li style="background-color: #E71C18; border: solid 1px #F82723;" id="1">Demo 1</li>
                <li style="background-color: #588500; border: solid 1px #5f9000;" id="2">Demo 2</li>
                <li style="background-color: #1d1d1d; border: solid 1px #000;" id="3">Demo 3</li>
            </ul>
        </div>
        <div id="red-contents" class="contents" style="border: solid 1px #F82723;">
            <pre>
            <script>
          $('#red').smartpaginator({ totalrecords: 100, 
                                      recordsperpage: 10,
                                      theme: 'red', 
                                      controlsalways:true,
                                      onchange: function(newPage){
                                            $('#r').html('Page # ' + newPage);
                                   }});
            
          </script>
        </pre>
            <p>
                This demo shows the use of onchange callback, on each page click you'll get the
                new page no. So, you can pull data from your datasource, probably database or some
                xml file. Smart Pagination can also filter your data automatically, this is usefull
                if you only want client side pagination. Obvioulsy this will be suitable only for
                small data. It also keeps first,prev,next, last buttons always visible using the 'controlsalways' property.
                Click on Demo 2 to see and example.
               
            </p>
            <div style="height: 65px; text-align: center; font-size: 2em; padding-top: 40px;
                color: #F82723" id="r">
                Page # 1
                <c:forEach items="${tarefas}" var="tarefa" varStatus="id">
     			 <!--  <tr bgcolor="#${id.count % 2 == 0 ? 'dccaa' : 'fffddd'}">-->
                 <td>${tarefa.id}</td>
				</c:forEach>
            </div>
            <div id="red" style="margin: auto;">
            </div>
        </div>
        <div id="green-contents" class="contents" style="border: solid 1px #5f9000;">
            <pre>
            <script>
         $('#green').smartpaginator({ totalrecords: 10,
                                      recordsperpage: 3, 
                                      datacontainer: 'mt', 
                                      dataelement: 'tr',
                                      theme: 'green' });
         </script>
        </pre>
            <p>
                This demo shows how Smart Paginator can filter your data automatically. Here we
                have an HTML table with 10 rows and 6 columns, and we want 3 recods to be displayed
                on each page. For this you need to pass the id of the HTML table you want Smart
                Paginator to filter see the datacontainer property, and you also need to set the
                dataelement tag which is 'tr' for a table. 'datacontainer' and 'dataelement' properties
                establish parent child relation, you can pass any element other than table as 'datacontainer'
                and set the 'dataelement', Smart Paginator will filter the 'dataelements' gracefull.
                See Demo 3 for for an example of this.
            </p>
            <table id="mt" cellpadding="0" cellspacing="0" border="0" class="table">
                <tr class="header">
                    <th>
                        Col1
                    </th>
                    <th>
                        Col2
                    </th>
                    <th>
                        Col3
                    </th>
                    <th>
                        Col4
                    </th>
                    <th>
                        Col5
                    </th>
                    <th>
                        Col6
                    </th>
                </tr>
                <tr>
                    <td>
                        01
                    </td>
                    <td>
                        02
                    </td>
                    <td>
                        03
                    </td>
                    <td>
                        04
                    </td>
                    <td>
                        05
                    </td>
                    <td>
                        06
                    </td>
                </tr>
                <tr>
                    <td>
                        11
                    </td>
                    <td>
                        12
                    </td>
                    <td>
                        13
                    </td>
                    <td>
                        14
                    </td>
                    <td>
                        15
                    </td>
                    <td>
                        16
                    </td>
                </tr>
                <tr>
                    <td>
                        21
                    </td>
                    <td>
                        22
                    </td>
                    <td>
                        23
                    </td>
                    <td>
                        24
                    </td>
                    <td>
                        25
                    </td>
                    <td>
                        26
                    </td>
                </tr>
                <tr>
                    <td>
                        31
                    </td>
                    <td>
                        32
                    </td>
                    <td>
                        33
                    </td>
                    <td>
                        34
                    </td>
                    <td>
                        35
                    </td>
                    <td>
                        36
                    </td>
                </tr>
                <tr>
                    <td>
                        41
                    </td>
                    <td>
                        42
                    </td>
                    <td>
                        43
                    </td>
                    <td>
                        44
                    </td>
                    <td>
                        45
                    </td>
                    <td>
                        46
                    </td>
                </tr>
                <tr>
                    <td>
                        51
                    </td>
                    <td>
                        52
                    </td>
                    <td>
                        53
                    </td>
                    <td>
                        54
                    </td>
                    <td>
                        55
                    </td>
                    <td>
                        56
                    </td>
                </tr>
                <tr>
                    <td>
                        61
                    </td>
                    <td>
                        62
                    </td>
                    <td>
                        63
                    </td>
                    <td>
                        64
                    </td>
                    <td>
                        65
                    </td>
                    <td>
                        66
                    </td>
                </tr>
                <tr>
                    <td>
                        71
                    </td>
                    <td>
                        72
                    </td>
                    <td>
                        73
                    </td>
                    <td>
                        74
                    </td>
                    <td>
                        75
                    </td>
                    <td>
                        76
                    </td>
                </tr>
                <tr>
                    <td>
                        81
                    </td>
                    <td>
                        82
                    </td>
                    <td>
                        83
                    </td>
                    <td>
                        84
                    </td>
                    <td>
                        85
                    </td>
                    <td>
                        86
                    </td>
                </tr>
                <tr>
                    <td>
                        91
                    </td>
                    <td>
                        92
                    </td>
                    <td>
                        93
                    </td>
                    <td>
                        94
                    </td>
                    <td>
                        95
                    </td>
                    <td>
                        96
                    </td>
                </tr>
            </table>
            <div id="green" style="margin: auto;">
            </div>
        </div>
        <div id="black-contents" class="contents" style="border: solid 1px #000;">
            <pre>
            <script>
          $('#black').smartpaginator({ totalrecords: 5,
                                        recordsperpage: 1,
                                        datacontainer: 'divs', 
                                        dataelement: 'div',
                                        theme: 'black' });
          </script>
        </pre>
            <p>
              <!--  <td>${requestScope.quant} </td> -->	
          
            </p>
            <div id="divs">
                <div>
                    <h4>
                        <a href="http://www.egrappler.com/jquery-content-slider-jscarousel/">jQuery Content
                         Slider:jsCarousel</a></h4>
                       <p>
                       	 <c:forEach items="${tarefas}" var="tarefa" begin="${rowStart-1}" 
                       	 step="1" end="${rowEnd-1}" varStatus="id">
     			 <!--  <tr bgcolor="#${id.count % 2 == 0 ? 'dccaa' : 'fffddd'}">-->
                           <p><td>${tarefa.id}-</td></p>
				        </c:forEach>
                       </p>
                </div>
                <div>
                    <h4>
                        <a href="http://www.egrappler.com/jquery-image-preload-plugin-smart-preloader/">jQuery
                            Image Preload Plugin: Smart Preload</a></h4>
                    <p>	 <c:forEach items="${tarefas}" var="tarefa" begin="${rowStart-1}" 
                       	 step="1" end="${rowEnd-1}" varStatus="id">
     			 <!--  <tr bgcolor="#${id.count % 2 == 0 ? 'dccaa' : 'fffddd'}">-->
                           <td>${tarefa.id}-</td>
				        </c:forEach>
				       <c:set value="${total}" var="rLen"/>  
  
<c:choose>  
    <c:when test="${rLen lt rowEnd}">  
        <c:set var="rCurrEnd" value="${rLen}"/>  
    </c:when>  
    <c:otherwise>  
        <c:set var="rCurrEnd" value="${rowEnd}"/>  
    </c:otherwise>  
</c:choose>  
  
  
     
  
  
     Mostrando ${rowStart}/${rCurrEnd} de ${rLen}  
      <br>  
  </p>
                </div>
                <div>
                    <h4>
                        <a href="http://www.egrappler.com/jquery-pagination-plugin-smart-paginator/">jQuery
                            Pagination Plugin:Smart Paginator</a></h4>
                    <p>
                        TRÊS</p>
                </div>
                <div>
                    <h4>
                        <a href="http://www.egrappler.com/jquery-spin-button-plugin-smart-spin/">jQuery Spin
                            Button Plugin:Smart Spin</a></h4>
                    <p>
                       QUATRO
                    </p>
                </div>
                <div>
                    <h4>
                        <a href="http://www.egrappler.com/jquery-slidertrackbar-smart-slider/">jQuery Slider/Trackbar
                            Plugin:Smart Slider</a></h4>
                    <p>
                        CINCO</p>
                </div>
            </div>
            <div id="black" style="margin: auto;">
            </div>
        </div>
    </div>
</body>
</html>
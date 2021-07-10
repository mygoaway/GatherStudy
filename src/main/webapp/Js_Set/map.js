	function initMap() {
        const myLatLng = { lat: 37.49871812680925, lng: 127.02752327865993 };
        /* 임시로 작성해둔 아이콘 이름*/
        var locations = [
            ['잠식 스터디카페', 37.498661387972156, 127.02803103259744],
            ['윙스터디', 37.498217944723976, 127.02535383640952],
            ['스터디불룸', 37.50020546115585, 127.02837936807222],
            ['포텐스터디', 37.50102076333368, 127.02508745461643],
            ['스카이스터디', 37.50158910518342, 127.02421742725323],
            ['노블스터디', 37.500610885564264, 127.0285610827436],
            ['굿브라더스페이스', 37.501019445476395, 127.02907606685496],
            ['헬로룸카페', 37.50224511180299, 127.02708050339382],
            ['공간29', 37.498427526865875, 127.02534376003847],
            ['일등파티 스터디룸', 37.49890218495464, 127.03396036709121],
            ['더공간스터디룸', 37.49589580431219, 127.03050201897133],
            ['502스터디카페 강남센터점', 37.493909490593936, 127.02842333648154],
          ];
        /* 아이콘 누를시 info 작성에 나올 스타일 (아직 적용 안된 부분)*/
        const contentString =
            '<div id="content">' +
            '<div id="siteNotice">' +
            "</div>" +
            '<h1 id="firstHeading" class="firstHeading">Uluru</h1>' +
            '<div id="bodyContent">' +
            "<p><b>Uluru</b>, also referred to as <b>Ayers Rock</b>, is a large " +
            "sandstone rock formation in the southern part of the " +
            "Northern Territory, central Australia. It lies 335&#160;km (208&#160;mi) " +
            "south west of the nearest large town, Alice Springs; 450&#160;km " +
            "(280&#160;mi) by road. Kata Tjuta and Uluru are the two major " +
            "features of the Uluru - Kata Tjuta National Park. Uluru is " +
            "sacred to the Pitjantjatjara and Yankunytjatjara, the " +
            "Aboriginal people of the area. It has many springs, waterholes, " +
            "rock caves and ancient paintings. Uluru is listed as a World " +
            "Heritage Site.</p>" +
            '<p>Attribution: Uluru, <a href="https://en.wikipedia.org/w/index.php?title=Uluru&oldid=297882194">' +
            "https://en.wikipedia.org/w/index.php?title=Uluru</a> " +
            "(last visited June 22, 2009).</p>" +
            "</div>" +
            "</div>";
            
          var map = new google.maps.Map(document.getElementById('map'), {
            zoom: 16,
            center: myLatLng,
          });

          var infowindow = new google.maps.InfoWindow();

          var marker, i;

          for (i = 0; i < locations.length; i++) {  
            marker = new google.maps.Marker({
              position: new google.maps.LatLng(locations[i][1], locations[i][2]),
              map: map
            });

            google.maps.event.addListener(marker, 'click', (function(marker, i) {
              return function() {
                infowindow.setContent(locations[i][0]);
                infowindow.open(map, marker);
              }
            })(marker, i));
          }    
        }
          

const searchForm = document.getElementById('search');
const results = document.getElementById('suggestions');

const populateAutocomplete = (data) => {
  const firstFive = [data[1][0], data[1][1], data[1][2], data[1][3], data[1][4]];
  console.log(firstFive)
  firstFive.forEach((suggestion) => {
    const resultItem = `<li>
    <p>${suggestion}</p>
    </li>`
    results.insertAdjacentHTML('beforeend', resultItem)
  });
};

const fetchSuggestions = (query) => {
  const suggestionsUrl = `http://suggestqueries.google.com/complete/search?client=firefox&ds=yt&q=${query}`;
  // const apiUrl = `/search?q=${url}`;
  const apiUrl = `https://cors-anywhere.herokuapp.com/${suggestionsUrl}`;
  results.innerHTML = "";
  fetch(apiUrl)
  .then(response => response.json())
  .then((data) => {
    populateAutocomplete(data);
  });
};

const initAutocomplete = () => {
  searchForm.addEventListener('keyup', (event) => {
    fetchSuggestions(searchForm.value);
  });
};


export { initAutocomplete }





// const initAutocomplete = () => {
//   console.log($("#youtube"))
//   if (document.getElementById('youtube')) {
//     $("#youtube").autocomplete({
//     source: function(request, response){
//         /* google geliştirici kimliği (zorunlu değil) */
//         const apiKey = 'AIzaSyDB9ypRe8INNPx40PzM_iDU5rwbym0Ungk';
//         /* aranacak kelime */
//         const query = request.term;
//         /* youtube sorgusu */
//         $.ajax({
//             url: "https://suggestqueries.google.com/complete/search?hl=en&ds=yt&client=youtube&hjson=t&cp=1&q="+query+"&key="+apiKey+"&format=5&alt=json&callback=?",
//             dataType: 'jsonp',
//             success: function(data, textStatus, request) {
//                response( $.map( data[1], function(item) {
//                     return {
//                         label: item[0],
//                         value: item[0]
//                     }
//                 }));
//             }
//         });
//     },
//     /* seçilene işlem yapmak için burayı kullanabilirsin */
//     select: function( event, ui ) {
//         $.youtubeAPI(ui.item.label);
//     }
//   });
// }
// }
/* Butona Basınca Arama */
// $('button#submit').click(function(){
//     const value = $('input#youtube').val();
//         $.youtubeAPI(value);
// });

// $.youtubePlay = function(yid, frame){
//     $('.youtubeOynat').slideUp().empty();
//     $('#'+yid).slideDown().html('<iframe src="'+ frame +'&autoplay=1" style="width: 100%; box-sizing: border-box; height: 300px" />');
// }

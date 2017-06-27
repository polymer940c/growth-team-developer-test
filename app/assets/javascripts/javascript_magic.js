
$( document ).ready(function() {
    // on load, check with localStorage if any are favorited
    checkIfGemInFav()
    // onload check if no_match
    if ($('#render_no_match').length) {
        var noMatchObject = $('#render_no_match').data('url')
        // change the que of the searchb bar
        changeSearchQue(noMatchObject.name)
        // change it red
        $('#search_input').css({'color': 'red','border': 'solid 1.5px'})
        $('#render_no_match').css({'color': 'red'})
    }
    $('div.nav>a').click(
        function(){

            $('div.nav>a.active').removeClass('active');
             $(this).addClass('active');

        }
    )
});
function checkIfGemInFav() {
    $('.title_and_star_row').each(function(index) {
        var element = $(this).find('i')[0]
        var elementName = $(this).find('a').text().replace(/\s/g,'')
        var favoritesArray = localStorage['favorites'].split(' ')

        if (favoritesArray.includes(elementName)) {
            changeBackgroundStar(element)
        }
    })
}


function changeSearchQue(nameString) {
    $("#search_input").val(nameString)
}

function changeBackgroundStar(element) {
    element.style.background = 'url(/assets/star-blue.png) no-repeat center'
}

function addToFavorite(element) {
    changeBackgroundStar(element)

    if (localStorage['favorites']) {
        var favorites = localStorage['favorites'].split(' ')
        var elementName = $(element).siblings().text().replace(/\s/g,'')

        favorites.push(elementName)

        localStorage['favorites'] = favorites.join(' ')
    } else {
        // theres no favorites, adding one to favorite
        localStorage['favorites'] = $(element).siblings().text().replace(/\s/g,'')
    }

}

function passLocalStorageToController() {
    event.preventDefault()
    $.ajax({
        type: "get",
        url: '/favorites',
        data: localStorage,
        success: function(response){
            $('#search_render').replaceWith(response)
            checkIfGemInFav()
        },
        error: function(){
            alert('Error');
        }
    });

}

function changeActiveNav() {

}

if('geolocation' in navigator){
    navigator.geolocation.getCurrentPosition((position) => {
        alert(position.coords.latitude +""+ position.coords.longitude);
    });
}
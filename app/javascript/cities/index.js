const searchCity = () => {
  if (document.getElementById("search")) {
    const inputElement = document.getElementById("search");
    inputElement.addEventListener("keyup", (event) => {
      const value = event.currentTarget.value;
      const url = `https://api-adresse.data.gouv.fr/search/?q=${value}&type=municipality&autocomplete=1`;
      const ulElement = document.getElementById("results");

      if (value !== "") {
        fetch(url)
        .then(response => response.json())
        .then((data) => {
          const cities = data.features;
          ulElement.innerHTML = "";
          if (cities) {
            cities.forEach(city => {
              const liElement = document.createElement("li");
              const aElement = document.createElement("a");
              aElement.setAttribute('href', `/cities?name=${city.properties.label}&longitude=${city.geometry.coordinates[0]}&latitude=${city.geometry.coordinates[1]}&department=${city.properties.context.split(", ")[0]}&region=${city.properties.context.split(", ")[2]}&country=France`);
              aElement.setAttribute('data-method', 'post');
              aElement.innerHTML = `${city.properties.label}, ${city.properties.context.split(", ")[1]}`;
              ulElement.appendChild(liElement);
              liElement.appendChild(aElement);
            });
          }
        });
      }
    });
  }
}

export { searchCity };

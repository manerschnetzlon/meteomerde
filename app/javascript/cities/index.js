const searchCity = () => {
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
            aElement.setAttribute('href', `/cities?name=${city.properties.label}`);
            aElement.setAttribute('data-method', 'post');
            // aElement.setAttribute('data-params', `name=${city.properties.label}`);
            // aElement.setAttribute('data-remote', 'true');
            aElement.innerHTML = city.properties.label;
            liElement.dataset.name = city.properties.city;
            liElement.dataset.longitude = city.geometry.coordinates[0];
            liElement.dataset.latitude = city.geometry.coordinates[1];
            liElement.dataset.department = city.properties.context.split(", ")[0];
            liElement.dataset.region = city.properties.context.split(", ")[2];
            ulElement.appendChild(liElement);
            liElement.appendChild(aElement);
          });
        }
      });
    }
  });
}

export { searchCity };

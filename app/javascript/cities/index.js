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
        // .forEach((city) => {
        //   cities.push(city.properties.label);
        // });
        ulElement.innerHTML = "";
        if (cities) {
          cities.forEach(city => {
            const liElement = document.createElement("li");
            liElement.innerHTML = city.properties.label;
            ulElement.appendChild(liElement);
          });
        }
      });
    }
  });
}

export { searchCity };

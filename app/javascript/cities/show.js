// const selectWeatherPrevision = () => {
//   if (document.querySelectorAll(".has-events")) {
//     const previsions = document.querySelectorAll(".has-events");
//     previsions[0].classList.add("active");
//     previsions.forEach(prevision => {
//       prevision.addEventListener("click", (event) => {
//         const previsionId = event.currentTarget.firstElementChild.id;
//         console.log(previsionId);
//         previsions.forEach(prev => {
//           prev.classList.remove("active");
//         });
//         event.currentTarget.classList.add("active");;
//         document.querySelector(".card_weather").innerHTML = ("<h1>COUCOU</h1>");
//         // document.querySelector(".card_weather").innerHTML = '<%= render("partials/_infos_weather_prevision.html.erb", previsions: @previsions.last) %>';
//       });
//     });
//   }
// }

// export { selectWeatherPrevision };

document.addEventListener("DOMContentLoaded", async () => {
  try {
    const response = await fetch("../backend/get_user.php", {
      credentials: "include", // important pour envoyer le cookie PHP
    });

    const data = await response.json();

    if (data.error) {
      window.location.href = "login-register.html";
      return;
    }

    const { user, films } = data;

    // Affichage du profil utilisateur
    document.getElementById("user-name").textContent = user.username;
    document.getElementById("user-email").textContent = user.email;
    document.querySelector(".avatar").textContent = user.username.charAt(0).toUpperCase();

    // Exemple : afficher les films vus
    const watchedContainer = document.getElementById("watched-movies");
    watchedContainer.innerHTML = "";
    films.vu.forEach((movie) => {
      const card = document.createElement("div");
      card.className = "movie-card";
      card.innerHTML = `
        <img src="${movie.poster_url}" alt="${movie.title}">
        <div class="movie-title">${movie.title}</div>
      `;
      watchedContainer.appendChild(card);
    });

    // Exemple : afficher les films à voir
    const watchlistContainer = document.getElementById("watchlist-movies");
    watchlistContainer.innerHTML = "";
    films.envie.forEach((movie) => {
      const card = document.createElement("div");
      card.className = "movie-card";
      card.innerHTML = `
        <img src="${movie.poster_url}" alt="${movie.title}">
        <div class="movie-title">${movie.title}</div>
      `;
      watchlistContainer.appendChild(card);
    });
  } catch (err) {
    console.error("Erreur lors du chargement du profil :", err);
    window.location.href = "login-register.html";
  }
});

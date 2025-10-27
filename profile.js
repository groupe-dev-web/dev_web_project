document.addEventListener("DOMContentLoaded", async () => {
  // Charger les infos du profil depuis le backend PHP
  try {
    const response = await fetch("http://localhost/project/api/get_user.php", {
      credentials: "include",
    });
    const user = await response.json();

    if (user && user.email) {
      document.getElementById("user-name").textContent = user.name;
      document.getElementById("user-email").textContent = user.email;
      document.querySelector(".avatar").textContent = user.name.charAt(0).toUpperCase();
    } else {
      window.location.href = "login.html";
    }
  } catch (err) {
    console.error("Erreur lors du chargement de l'utilisateur :", err);
    window.location.href = "login.html";
  }

  // Exemple statique pour les stats et films
  const stats = {
    watched: 3,
    watchlist: 2,
    owned: 1,
    selling: 0,
  };

  document.getElementById("watched-count").textContent = stats.watched;
  document.getElementById("watchlist-count").textContent = stats.watchlist;
  document.getElementById("owned-count").textContent = stats.owned;
  document.getElementById("selling-count").textContent = stats.selling;

  const sampleMovies = [
    { title: "Inception", poster: "https://image.tmdb.org/t/p/w300/AjQlc1Vjs2u9l0a2N2nZiyWwZqD.jpg" },
    { title: "Interstellar", poster: "https://image.tmdb.org/t/p/w300/gEU2QniE6E77NI6lCU6MxlNBvIx.jpg" },
    { title: "Tenet", poster: "https://image.tmdb.org/t/p/w300/k68nPLbIST6NP96JmTxmZijEvCA.jpg" },
  ];

  const watchedContainer = document.getElementById("watched-movies");
  sampleMovies.forEach((movie) => {
    const card = document.createElement("div");
    card.className = "movie-card";
    card.innerHTML = `
      <img src="${movie.poster}" alt="${movie.title}">
      <div class="movie-title">${movie.title}</div>
    `;
    watchedContainer.appendChild(card);
  });

  // Gestion des onglets
  const tabs = document.querySelectorAll(".tab-btn");
  const contents = document.querySelectorAll(".tab-content");

  tabs.forEach((btn) => {
    btn.addEventListener("click", () => {
      tabs.forEach((b) => b.classList.remove("active"));
      contents.forEach((c) => c.classList.remove("active"));
      btn.classList.add("active");
      const target = btn.getAttribute("data-tab");
      document.getElementById(`tab-${target}`).classList.add("active");
    });
  });
});
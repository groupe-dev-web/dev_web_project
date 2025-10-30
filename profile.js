document.addEventListener("DOMContentLoaded", async () => {
  try {
    const res = await fetch("get_user_data.php");
    const data = await res.json();

    if (data.error) {
      // Redirige si l'utilisateur n'est pas connecté
      window.location.href = "login.html";
      return;
    }

    // Affiche les infos utilisateur
    document.getElementById("user-name").textContent = data.user.display_name || data.user.username;
    document.getElementById("user-email").textContent = data.user.email;
    document.querySelector(".avatar").textContent = (data.user.display_name || data.user.username)[0].toUpperCase();

    // Compteurs
    document.getElementById("watched-count").textContent = data.watched.length;
    document.getElementById("watchlist-count").textContent = data.want_to_watch.length;
    document.getElementById("owned-count").textContent = data.owned.length;
    document.getElementById("selling-count").textContent = data.want_to_sell.length;

    // Fonction pour afficher les films
    const displayMovies = (listId, movies) => {
      const container = document.getElementById(listId);
      container.innerHTML = "";
      if (movies.length === 0) {
        container.previousElementSibling.style.display = "block";
      } else {
        container.previousElementSibling.style.display = "none";
        movies.forEach(movie => {
          const card = document.createElement("div");
          card.classList.add("movie-card");
          card.innerHTML = `
            <img src="${movie.poster_url || 'placeholder.jpg'}" alt="${movie.title}">
            <p>${movie.title}</p>
          `;
          container.appendChild(card);
        });
      }
    };

    // Affiche les listes
    displayMovies("watched-movies", data.watched);
    displayMovies("watchlist-movies", data.want_to_watch);
    displayMovies("owned-movies", data.owned);
    displayMovies("selling-movies", data.want_to_sell);

  } catch (err) {
    console.error("Erreur :", err);
  }

  // Déconnexion
  // --- Gestion du bouton Logout ---
document.getElementById("logout-btn").addEventListener("click", async () => {
  try {
    const res = await fetch("auth.php?action=logout", {
      method: "GET",
      credentials: "include"
    });
    const data = await res.json();

    if (data.success) {
      // Supprime la session et redirige vers la page de login
      window.location.href = "login.html";
    } else {
      alert("Erreur lors de la déconnexion.");
    }
  } catch (error) {
    console.error("Erreur lors du logout :", error);
  }
});

  });

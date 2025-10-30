document.addEventListener("DOMContentLoaded", async () => {
  const container = document.getElementById("universesContainer");

  try {
    const res = await fetch("./get_movies.php", { credentials: "include" });
    const data = await res.json();

    if (!data.success) {
      container.innerHTML = `<p class="error">${data.message}</p>`;
      return;
    }

    const universes = data.data;

    universes.forEach((universe) => {
      const universeDiv = document.createElement("div");
      universeDiv.classList.add("universe");

      universeDiv.innerHTML = `
        <div class="universe-header">
          <h2>${universe.universe_name}</h2>
          <button class="toggle-btn">+</button>
        </div>
        <div class="movies-list" style="display:none;"></div>
      `;

      const movieList = universeDiv.querySelector(".movies-list");

      universe.movies.forEach((movie) => {
        const movieCard = document.createElement("div");
        movieCard.classList.add("movie-card");

        movieCard.innerHTML = `
          <div class="movie-info-container">
            ${
              movie.poster_url
                ? `<img src="${movie.poster_url}" alt="${movie.title}" class="poster">`
                : `<div class="poster placeholder">Image à venir</div>`
            }
            <div class="movie-details">
              <h3>${movie.title}</h3>
              <p>Sorti le : ${movie.release_date || "—"}</p>
              <p>${movie.synopsis || "Pas de résumé."}</p>
              <label>Status :</label>
              <select class="status-select" data-film-id="${movie.id}">
                <option value="">—</option>
                <option value="watched" ${movie.status === "watched" ? "selected" : ""}>Vu</option>
                <option value="want_to_watch" ${movie.status === "want_to_watch" ? "selected" : ""}>À voir</option>
                <option value="owned" ${movie.status === "owned" ? "selected" : ""}>Possédé</option>
                <option value="want_to_sell" ${movie.status === "want_to_sell" ? "selected" : ""}>À vendre</option>
              </select>
            </div>
          </div>
        `;

        movieList.appendChild(movieCard);
      });

      const toggleBtn = universeDiv.querySelector(".toggle-btn");
      const moviesList = universeDiv.querySelector(".movies-list");

      // ouvrir/fermer l’univers
      toggleBtn.addEventListener("click", () => {
        const open = moviesList.style.display === "block";
        moviesList.style.display = open ? "none" : "block";
        toggleBtn.textContent = open ? "+" : "–";
        // sauvegarde état dans localStorage
        localStorage.setItem(`universe_${universe.universe_id}_open`, !open);
      });

      // restaurer état ouvert/fermé
      const wasOpen = localStorage.getItem(`universe_${universe.universe_id}_open`) === "true";
      if (wasOpen) {
        moviesList.style.display = "block";
        toggleBtn.textContent = "–";
      }

      container.appendChild(universeDiv);
    });

    // --- gestion du changement de statut ---
    container.addEventListener("change", async (e) => {
      if (!e.target.classList.contains("status-select")) return;
      const filmId = e.target.dataset.filmId;
      const status = e.target.value;

      try {
        const res = await fetch("./update_user_film.php", {
          method: "POST",
          headers: { "Content-Type": "application/json" },
          credentials: "include",
          body: JSON.stringify({ film_id: filmId, status }),
        });
        const result = await res.json();

        if (!result.success) {
          alert("Erreur : " + result.message);
        }
      } catch (err) {
        alert("Erreur réseau lors de la mise à jour.");
      }
    });

    // --- recherche ---
    const searchInput = document.getElementById("search-input");
    searchInput.addEventListener("input", (e) => {
      const query = e.target.value.toLowerCase();
      document.querySelectorAll(".movie-card").forEach((card) => {
        const title = card.querySelector("h3").textContent.toLowerCase();
        card.style.display = title.includes(query) ? "block" : "none";
      });
    });
  } catch (err) {
    container.innerHTML = `<p class="error">Erreur de connexion au serveur</p>`;
    console.error(err);
  }
});

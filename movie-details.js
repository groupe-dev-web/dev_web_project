document.addEventListener("DOMContentLoaded", async () => {
  const urlParams = new URLSearchParams(window.location.search);
  const filmId = urlParams.get("id");

  if (!filmId) {
    document.body.innerHTML = "<p>Film non spécifié. Utilisez movie-details.html?id=FILM_ID</p>";
    return;
  }

  const endpoint = `http://localhost/PROJETWEBDEVDISNEY/get_film_detail.php?id=${encodeURIComponent(filmId)}`;

  try {
    const res = await fetch(endpoint, { credentials: "include" });
    const data = await res.json();

    if (!data.success) {
      document.body.innerHTML = `<p>Erreur : ${data.message || "données introuvables"}</p>`;
      return;
    }

    const film = data.film;

    document.getElementById("movieTitle").textContent = film.title || film.original_title || "Titre inconnu";
    document.getElementById("movieUniverse").textContent = film.universe_name || "—";
    document.getElementById("movieCategory").textContent = film.category || "—";
    document.getElementById("movieDate").textContent = film.release_date || "—";
    document.getElementById("movieSynopsis").textContent = film.synopsis || "Aucun synopsis disponible.";

    const img = document.getElementById("movieImage");
    img.src = film.poster_url && film.poster_url !== "" ? film.poster_url : "default.jpg";
    img.onerror = () => { img.src = "default.jpg"; };

    const statusSelect = document.getElementById("statusSelect");
    statusSelect.dataset.filmId = filmId;
    statusSelect.value = data.user_status || "";

    const ownersList = document.getElementById("ownersList");
    ownersList.innerHTML = "";
    if (Array.isArray(data.owners) && data.owners.length > 0) {
      data.owners.forEach(u => {
        const li = document.createElement("li");
        li.textContent = `${u.username} — ${u.status === "want_to_sell" ? "vend" : "possède"} (${u.email || "email non disponible"})`;
        ownersList.appendChild(li);
      });
    } else {
      ownersList.innerHTML = "<li>Aucun utilisateur ne possède ou ne vend ce film.</li>";
    }

    document.getElementById("backBtn").addEventListener("click", () => {
      window.location.href = "movies.html";
    });

    const logoutBtn = document.getElementById("logout");
    if (logoutBtn) {
      logoutBtn.addEventListener("click", async () => {
        try {
          await fetch("http://localhost/PROJETWEBDEVDISNEY/auth.php?action=logout", { credentials: "include" });
        } catch {}
        window.location.href = "login.html";
      });
    }

    statusSelect.addEventListener("change", async (e) => {
      const newStatus = e.target.value;
      try {
        const r = await fetch("http://localhost/PROJETWEBDEVDISNEY/update_user_film.php", {
          method: "POST",
          headers: { "Content-Type": "application/json" },
          credentials: "include",
          body: JSON.stringify({ film_id: filmId, status: newStatus })
        });
        const jr = await r.json();
        if (!jr.success) alert("Erreur mise à jour: " + jr.message);
      } catch {
        alert("Erreur réseau lors de la mise à jour.");
      }
    });

  } catch (err) {
    console.error(err);
    document.body.innerHTML = "<p>Erreur lors du chargement — voir console pour détails.</p>";
  }
});

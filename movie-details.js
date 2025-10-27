// Simulated movie data (normally you'd fetch from backend or localStorage)
const sampleMovie = {
  title: "Avengers: Endgame",
  universe: "Marvel",
  category: "MCU Phase 3",
  date: "2019",
  synopsis:
    "After the devastating events of Avengers: Infinity War, the universe is in ruins. The remaining Avengers assemble once more to reverse Thanos' actions and restore balance to the universe.",
  image: "assets/endgame-poster.jpg",
  owners: ["Alice (selling)", "Bob", "Emma"],
};

// Fill page content
document.getElementById("movieTitle").textContent = sampleMovie.title;
document.getElementById("movieUniverse").textContent = sampleMovie.universe;
document.getElementById("movieCategory").textContent = sampleMovie.category;
document.getElementById("movieDate").textContent = sampleMovie.date;
document.getElementById("movieSynopsis").textContent = sampleMovie.synopsis;
document.getElementById("movieImage").src = sampleMovie.image;

const ownersList = document.getElementById("ownersList");
ownersList.innerHTML = "";
sampleMovie.owners.forEach((owner) => {
  const li = document.createElement("li");
  li.textContent = owner;
  ownersList.appendChild(li);
});

// Back button
document.getElementById("backBtn").addEventListener("click", () => {
  window.location.href = "movies.html";
});

// Logout button
document.getElementById("logout").addEventListener("click", () => {
  alert("Logged out!");
  window.location.href = "login.html";
});

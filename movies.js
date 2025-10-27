// Fake data for demonstration
const universes = [
  {
    name: "Disney",
    color: "#1E3A8A",
    movies: [
      { title: "The Lion King", date: "1994", category: "Classic" },
      { title: "Frozen", date: "2013", category: "Princess" },
      { title: "Moana", date: "2016", category: "Adventure" },
    ],
  },
  {
    name: "Pixar",
    color: "#0891B2",
    movies: [
      { title: "Toy Story", date: "1995", category: "Saga" },
      { title: "Coco", date: "2017", category: "Musical" },
      { title: "Inside Out", date: "2015", category: "Emotional" },
    ],
  },
  {
    name: "Marvel",
    color: "#DC2626",
    movies: [
      { title: "Iron Man", date: "2008", category: "MCU Phase 1" },
      { title: "Avengers: Endgame", date: "2019", category: "MCU Phase 3" },
      { title: "Black Panther", date: "2018", category: "Wakanda" },
    ],
  },
  {
    name: "Star Wars",
    color: "#000000",
    movies: [
      { title: "A New Hope", date: "1977", category: "Saga Skywalker" },
      { title: "The Force Awakens", date: "2015", category: "Sequel Trilogy" },
      { title: "Rogue One", date: "2016", category: "Anthology" },
    ],
  },
  {
    name: "Avatar",
    color: "#059669",
    movies: [
      { title: "Avatar", date: "2009", category: "Pandora" },
      { title: "Avatar: The Way of Water", date: "2022", category: "Pandora" },
    ],
  },
];

// Render universes
const universesContainer = document.getElementById("universesContainer");

universes.forEach((universe) => {
  const universeDiv = document.createElement("div");
  universeDiv.classList.add("universe");
  universeDiv.style.borderLeft = `4px solid ${universe.color}`;

  universeDiv.innerHTML = `
    <div class="universe-header">
      <h2>${universe.name}</h2>
      <button class="toggle-btn">+</button>
    </div>
    <div class="movies-list"></div>
  `;

  const movieList = universeDiv.querySelector(".movies-list");

  universe.movies.forEach((movie) => {
    const movieCard = document.createElement("div");
    movieCard.classList.add("movie-card");

    movieCard.innerHTML = `
      <h3>${movie.title}</h3>
      <p class="movie-info">${movie.category} | Released: ${movie.date}</p>
      <label>Status:</label>
      <select>
        <option>Seen</option>
        <option>Want to see</option>
        <option>Own (Blu-ray)</option>
        <option>Want to sell</option>
      </select>
      <div class="owner-list">Users owning this: Alice, Bob (selling)</div>
    `;
    movieList.appendChild(movieCard);
  });

  // Toggle visibility
  const toggleBtn = universeDiv.querySelector(".toggle-btn");
  toggleBtn.addEventListener("click", () => {
    const list = universeDiv.querySelector(".movies-list");
    const isVisible = list.style.display === "block";
    list.style.display = isVisible ? "none" : "block";
    toggleBtn.textContent = isVisible ? "+" : "–";
  });

  universesContainer.appendChild(universeDiv);
});

// Search feature
document.getElementById("searchInput").addEventListener("input", (e) => {
  const searchValue = e.target.value.toLowerCase();
  const allMovies = document.querySelectorAll(".movie-card");
  allMovies.forEach((card) => {
    const title = card.querySelector("h3").textContent.toLowerCase();
    card.style.display = title.includes(searchValue) ? "block" : "none";
  });
});

// Logout
document.getElementById("logout").addEventListener("click", () => {
  alert("Logged out!");
  window.location.href = "login.html";
});

// vars
var $tbody = document.querySelector("tbody");
var $dateInput = document.querySelector("#date");
var $cityInput = document.querySelector("#city");
var $stateInput = document.querySelector("#state");
var $countryInput = document.querySelector("#country");
var $shapeInput = document.querySelector("#shape");
var $searchBtn = document.querySelector("#search");
var $resetBtn = document.querySelector("#reset");
// searchButton and resetButton
$searchBtn.addEventListener("click", handleSearchButtonClick);
//could not get this to work idk why
//$resetBtn.addEventListener("click", handleResetButtonClick);


var filtData = dataSet;

// renderTable renders the filtered data to the tbody
function renderTable() {
  $tbody.innerHTML = "";
  for (var i = 0; i < filtData.length; i++) {
    var sighting = filtData[i];
    var newdat  = Object.keys(sighting);
    var $row = $tbody.insertRow(i);
    for (var j = 0; j < newdat.length; j++) {
      var newdatt = newdat[j];
      var $cell = $row.insertCell(j);
      $cell.innerText = sighting[newdatt];
    }
  }
}

function handleSearchButtonClick() {

  var filtDate = $dateInput.value.trim();
  if (filtDate != "") {
    filtData = dataSet.filter(function (sighting) {
      var sightingDate = sighting.datetime;
      return sightingDate === filtDate;
    });
  };
  var filtCity = $cityInput.value.trim().toLowerCase();
  if (filtCity != "") {
    filtData = filtData.filter(function (sighting) {
      var sightingCity = sighting.city;
      return sightingCity === filtCity;
    });
  };
  var filtState = $stateInput.value.trim().toLowerCase();
  if (filtState != "") {
    filtData = filtData.filter(function (sighting) {
      var sightingState = sighting.state;
      return sightingState === filtState;
    });
  };
  var filtCountry = $countryInput.value.trim().toLowerCase();
  if (filtCountry != "") {
    filtData = filtData.filter(function (sighting) {
      var sightingCountry = sighting.country;
      return sightingCountry === filtCountry;
    });
  };
  var filtShape = $shapeInput.value.trim().toLowerCase();
  if (filtShape != "") {
    filtData = filtData.filter(function (sighting) {
      var sightingShape = sighting.shape;
      return sightingShape === filtShape;
    });
  };
  renderTable();
};


// Reset the data and search form after a search
function handleResetButtonClick() {
  filteData = dataSet;
  $dateInput.value = "";
  $cityInput.value = "";
  $stateInput.value = "";
  $countryInput.value = "";
  $shapeInput.value = "";
  renderTable();
}

// Render the table for the first time on page load
renderTable();
<template>
  <div class="container">
    <div class="text-center">
      <h1 class="display-3 m-3">Számláim</h1>
    </div>

    <div class="d-flex">
      <div class="card mx-3">
        <div class="card-details">
          <p class="text-title">Dátum</p>
          <hr />
          <p class="text-body">Nagyon sokat fizettél</p>
          <p class="text-body">Nagyon sokat fizettél</p>
          <p class="text-body">Nagyon sokat fizettél</p>
          <p class="text-body">Nagyon sokat fizettél</p>
          <p class="text-body">Nagyon sokat fizettél</p>
        </div>
        <button class="card-button">More info</button>
      </div>

      <div class="card mx-3">
        <div class="card-details">
          <p class="text-title">Dátum</p>
          <hr />
          <p class="text-body">Nagyon sokat fizettél</p>
          <p class="text-body">Nagyon sokat fizettél</p>
          <p class="text-body">Nagyon sokat fizettél</p>
          <p class="text-body">Nagyon sokat fizettél</p>
          <p class="text-body">Nagyon sokat fizettél</p>
        </div>
        <button class="card-button">More info</button>
      </div>

      <div class="card mx-3">
        <div class="card-details">
          <p class="text-title">Dátum</p>
          <hr />
          <p class="text-body">Nagyon sokat fizettél</p>
          <p class="text-body">Nagyon sokat fizettél</p>
          <p class="text-body">Nagyon sokat fizettél</p>
          <p class="text-body">Nagyon sokat fizettél</p>
          <p class="text-body">Nagyon sokat fizettél</p>
        </div>
        <button class="card-button">More info</button>
      </div>
    </div>
  </div>
</template>

<script setup></script>

<style lang="scss" scoped>
.card {
  width: 380px;
  height: 508px;
  border-radius: 20px;
  background: #f5f5f5;
  position: relative;
  padding: 1.8rem;
  border: 2px solid #c3c6ce;
  transition: 0.5s ease-out;
  overflow: visible;
}

.card-details {
  color: black;
  height: 100%;
  gap: 0.5em;
  display: grid;
  place-content: center;
}

.card-button {
  transform: translate(-50%, 125%);
  width: 60%;
  border-radius: 1rem;
  border: none;
  background-color: #008bf8;
  color: #fff;
  font-size: 1rem;
  padding: 0.5rem 1rem;
  position: absolute;
  left: 50%;
  bottom: 0;
  opacity: 0;
  transition: 0.3s ease-out;
}

.text-body {
  color: rgb(134, 134, 134);
}

/*Text*/
.text-title {
  font-size: 1.5em;
  font-weight: bold;
  text-align: center;
}

/*Hover*/
.card:hover {
  border-color: #008bf8;
  box-shadow: 0 4px 18px 0 rgba(0, 0, 0, 0.25);
}

.card:hover .card-button {
  transform: translate(-50%, 50%);
  opacity: 1;
}
</style>

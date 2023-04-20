<template>


  <div class="reservation-bar row">
  <div class="display-3 text-center p-2" style="color:white">Szobafoglalás</div>
  <div class="container">
    <div class="my-3">
      
      <div class="col-12 col-md-3 col-sm-8 my-2 d-inline-flex">
        <label for="start_date">Érkezés időpontja:</label>
      <input
        type="date"
        class="mx-2 form-control py-3"
        name="start_date"
        id="start_date"
      />
      </div>

      <div class="col-12 col-md-3 col-sm-8 my-2 d-inline-flex">
        <label for="end_date">Távozás időpontja:</label>
      <input
        type="date"
        class="mx-2 form-control py-3"
        name="end_date"
        id="end_date"
      />
      </div>
      
      <div class="col-12 col-md-3 col-sm-8 my-2 d-inline-flex">
      <label for="select_vendeg">Vendégek száma:</label>
        <select class="form-select mx-3 py-3" id="select_vendeg" aria-label="Default select example">
        <option selected>Válasszon</option>
        <option value="1">1</option>
        <option value="2">2</option>
        <option value="3">3</option>
        <option value="4">4</option>
        <option value="5">5</option>
      </select>
      </div>

      <div class="col-12 col-md-3 col-sm-8 my-2 d-inline-flex">
        <label for="select_szoba">Szoba felszereltsége:</label>
        <select class="form-select mx-3 py-3" id="select_szoba" aria-label="Default select example">
        <option selected>Válasszon</option>
        <option value="1">Superior</option>
        <option value="1">Normal</option>
        <option value="1">VIP</option>
      </select>
      </div>
  
    </div>

    <div class="d-flex justify-content-center pb-2">
      <label class="checkbox-btn mx-2">
        <label for="checkbox_szauna">Szauna</label>
        <input id="checkbox_szauna" type="checkbox" />
        <span class="checkmark"></span>
      </label>

      <label class="checkbox-btn mx-2">
        <label for="checkbox_uszoda">Uszoda</label>
        <input id="checkbox_uszoda" type="checkbox" />
        <span class="checkmark"></span>
      </label>

      <label class="checkbox-btn mx-2">
        <label for="checkbox_kondi">Konditerem</label>
        <input id="checkbox_kondi" type="checkbox" />
        <span class="checkmark"></span>
      </label>
    </div>

  </div>
  <div class="justify-content-center d-flex p-2">
    <button class="sigin-btn" type="button"><span class="btn-text">Szobák keresése</span></button>
  </div>
  </div>

 

</template>

<script setup></script>

<style lang="scss" scoped>
#start_date,
#end_date,
#select_vendeg,
#select_szoba {
  width: 75%;
}


.col-12{
  vertical-align: middle;
}
.col-12 input{
  vertical-align:middle;
}
.sigin-btn {
  text-transform: uppercase;
  font-weight: 700;
  font-size: 0.75rem;
  line-height: 1rem;
  text-align: center;
  padding: 0.75rem 1.5rem;
  background-color: #fff;
  border-radius: 0.5rem;
  width: 25%;
  outline: 0;
  border: 1px solid #4e4e4e;
  color: #4e4e4e;
  transition: 0.1s;
}
.sigin-btn:hover {
  text-transform: uppercase;
  font-weight: 700;
  font-size: 0.75rem;
  line-height: 1rem;
  text-align: center;
  padding: 0.75rem 1.5rem;
  background-color: #fff;
  border-radius: 0.5rem;
  width: 25%;
  outline: 0;
  border: 1px solid #4e4e4e;
  color: #434343;
  transform: scale(1.05);
  transition: 0.1s;
}

@media (max-width: 767px){
  .sigin-btn{
    width: 50%;
  }
}
//gomb vége

/* Customize the label (the checkbox-btn) */
.checkbox-btn {
  display: block;
  position: relative;
  padding-left: 30px;
  margin-bottom: 10px;
  cursor: pointer;
  -webkit-user-select: none;
  -moz-user-select: none;
  -ms-user-select: none;
  user-select: none;
}

/* Hide the browser's default checkbox */
.checkbox-btn input {
  position: absolute;
  opacity: 0;
  cursor: pointer;
  height: 0;
  width: 0;
}

.checkbox-btn label {
  cursor: pointer;
  font-size: 18px;
}
/* Create a custom checkbox */
.checkmark {
  position: absolute;
  top: 0;
  left: 0;
  height: 25px;
  width: 25px;
  border: 2.5px solid #ffffff;
  transition: 0.2s linear;
}
.checkbox-btn input:checked ~ .checkmark {
  background-color: transparent;
}

/* Create the checkmark/indicator (hidden when not checked) */
.checkmark:after {
  content: "";
  position: absolute;
  visibility: hidden;
  opacity: 0;
  left: 50%;
  top: 40%;
  width: 10px;
  height: 14px;
  border: 2px solid #0ea021;
  filter: drop-shadow(0px 0px 10px #0ea021);
  border-width: 0 2.5px 2.5px 0;
  transition: 0.2s linear;
  transform: translate(-50%, -50%) rotate(-90deg) scale(0.2);
}

/* Show the checkmark when checked */
.checkbox-btn input:checked ~ .checkmark:after {
  visibility: visible;
  opacity: 1;
  transform: translate(-50%, -50%) rotate(0deg) scale(1);
  animation: pulse 1s ease-in;
}

.checkbox-btn input:checked ~ .checkmark {
  transform: rotate(45deg);
  border: none;
}

@keyframes pulse {
  0%,
  100% {
    transform: translate(-50%, -50%) rotate(0deg) scale(1);
  }
  50% {
    transform: translate(-50%, -50%) rotate(0deg) scale(1.6);
  }
}

//checkbox vége

.reservation-bar {
  background: linear-gradient(-45deg, #84f4dd, #b1d6f8, #98f8c0, #18ddf7);
  background-size: 400% 400%;
  animation: gradient 20s ease infinite;
  height: fit-content;
  margin-bottom: 1vw;
}

@keyframes gradient {
  0% {
    background-position: 0% 50%;
  }
  50% {
    background-position: 100% 50%;
  }
  100% {
    background-position: 0% 50%;
  }
}

.reservation-bar label {
  color: white;
}
</style>

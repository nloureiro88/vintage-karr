import "bootstrap";

import flatpickr from 'flatpickr'

// import { initUpdateNavbarOnScroll } from '../components/navbar'
// initUpdateNavbarOnScroll();

const currentDate = new Date();
const year = currentDate.getFullYear();
const month = currentDate.getMonth() + 1;
const day = currentDate.getDate();

const calcPrice = () => {

  const bookingDates = document.querySelectorAll(".booking-date")
  const startDate = new Date(bookingDates[0].value)
  const endDate = new Date(bookingDates[1].value)
  const price = parseInt(document.querySelector("#price-day").innerText)
  let priceSentence = ""

  if (bookingDates[0].value === "" || bookingDates[1].value === "") {
    priceSentence = "Please select both dates"
  } else if (startDate >= endDate) {
    priceSentence = "Invalid dates"
  } else {
    const days = (endDate - startDate) / (24 * 60 * 60 * 1000)
    priceSentence = `${days} days for ${(days * price).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ".")} €`
  }

  const totalPrice = document.querySelector("#total-price strong")
  totalPrice.innerHTML = ""
  totalPrice.insertAdjacentHTML("afterbegin", priceSentence)
}

flatpickr(".booking-date", {
  minDate: `${year}-${month}-${day}`,
  onChange: calcPrice
});

// const bookingDates = document.querySelectorAll(".booking-date")
// console.log(bookingDates)
// bookingDates.forEach((bookingDate) => {
//   bookingDate.addEventListener('', (event) => {


//   }
// })

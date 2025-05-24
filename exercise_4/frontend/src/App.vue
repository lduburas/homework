<script setup lang="ts">
import type { Invoice } from './entities/Invoice'
import type { Payment } from './entities/Payment'
import { ref } from 'vue'
import type { Ref } from 'vue'
import VueDatePicker from '@vuepic/vue-datepicker'
import '@vuepic/vue-datepicker/dist/main.css'

const createDefaultInvoice = () :Invoice => {
  return { open: false, date: new Date(), amount: 0, currency: 'EUR'} as Invoice ;
}

const createDefaultPayment = () :Payment => {
  return { date: new Date(), amount: 0, currency: 'EUR', invoiceId: -1}  as Payment;
}


const myDate = ref(new Date())

const invoice :Ref<Invoice> = ref(createDefaultInvoice())
const payment :Ref<Invoice> = ref(createDefaultPayment())  

const invoices :Ref<Invoice[]> = ref([])
const payments :Ref<Payment[]> = ref([])

function restInvoiceToView(data : any) {
 return {...data, open: false, date: new Date(data.date)} as Invoice;
}

function restPaymentToView(data : any) {
 return {...data, open: false, date: new Date(data.date)} as Payment;
}

const loadInvoices = async () => {
  const url = `/services/invoices`
  const loadedInvoices : any[] = await (await fetch(url)).json()
  invoices.value = loadedInvoices.map(restInvoiceToView)
};

const loadPayments = async (invoiceId:number) => {
  const url = `/services/invoices/${invoiceId}/payments`
  const loadedPayments : any[] = await (await fetch(url)).json()
  payments.value = loadedPayments.map(restPaymentToView)
};

function toggleOpen(invoice: Invoice ) {
  const open = !invoice.open
  if (open) {
    invoices.value.forEach((i) => {
      i.open = false
    })
    loadPayments(invoice.id)
  }
  invoice.open = open
}

function isValid() {
  return true;
}
function formatDate(date: Date) {
  const day = date.getDate();
  const month = (date.getMonth() + 1).toString().padStart(2, '0');
  const year = date.getFullYear();
  return `${year}-${month}-${day}`;
}

const createInvoice = async () => {
  if (isValid()) {
    const url = `/services/invoices`
    const body = JSON.stringify(invoice.value)
    const newInvoice = await (await fetch(url, {
      method: "POST",
      headers: {
        'Content-Type': 'application/json'
      },
      body 
    })).json()
    if (newInvoice.id) {
      invoices.value.push(restInvoiceToView(newInvoice))
    }
  }
}

const deleteInvoice = async (id?: number) => {
    const url = `/services/invoices`
    await fetch(`${url}/${id}`, {
      method: "DELETE"
    })
    loadInvoices();
}


loadInvoices();

</script>

<template>
  <main>
    <h1>Invoices</h1>
    <table class="invoiceList">
      <thead>
        <tr>
          <td></td>
          <td>Date</td>
          <td>Amount</td>
          <td>Currency</td>
          <td></td>
        </tr>
      </thead>
      <tbody>
        <template v-for="invoice in invoices">
          <tr >
            <td><button @click="() => toggleOpen(invoice)">{{invoice.open ? "V" : ">"}}</button></td>
            <td>{{ formatDate(invoice.date)}}</td>
            <td class="number">{{ invoice.amount }}</td>
            <td>{{ invoice.currency }}</td>
            <td>
              <button @click="() => deleteInvoice(invoice.id)">X</button>
            </td>
          </tr>
          <template v-if="invoice.open">
            <tr class="detail">
              <td></td>
              <td colspan="4">Payments</td>
            </tr>
            <tr class="detail" v-for="payment in payments">
              <td></td>
              <td>{{ formatDate(payment.date)}}</td>
              <td class="number">{{ payment.amount }}</td>
              <td>{{ payment.currency }}</td>
              <td>
                <button @click="() => null">X</button>
              </td>
            </tr>
            <tr class="detail">
              <td></td>
              <td><VueDatePicker :id="paymentDate" v-model="payment.date" :format="formatDate"></VueDatePicker></td>
              <td><input class="number" v-model="payment.amount"></td>
              <td>
                <select v-model="payment.currency">
                  <option value="EUR">Eur</option>
                  <option value="USD">Usd</option>
                </select>
              </td>
              <td>
                <button @click="createPayment">Create Payment</button>
              </td>
            </tr>
          </template>
        </template>
        <tr>
          <td></td>
          <td><VueDatePicker v-model="invoice.date" :format="formatDate"></VueDatePicker></td>
          <td><input class="number" v-model="invoice.amount"></td>
          <td>
            <select v-model="invoice.currency">
              <option value="EUR">Eur</option>
              <option value="USD">Usd</option>
            </select>
          </td>
          <td>
            <button @click="createInvoice">Create Invoice</button>
          </td>
        </tr>
      </tbody>
    </table>
  </main>
</template>

<style scoped>

.number {
  text-align: right;
}

.invoiceList {
  border-spacing: 0px;
}

.detail {
  background-color:darkslategray;
}

.invoiceList td {
  padding: 3px;
}

#paymentDate #invoiceDate {
  padding-top: 0px;
  padding-bottom: 0px;
}

</style>
<style>
:root {
--dp-font-size: 13.333px;
--dp-input-padding: 0px 30px 0px 12px;
}
</style>
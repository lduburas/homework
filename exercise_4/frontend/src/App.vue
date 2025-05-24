<script setup lang="ts">
import type { Invoice } from './entities/Invoice'
import { ref } from 'vue'
import type { Ref } from 'vue'
import VueDatePicker from '@vuepic/vue-datepicker'
import '@vuepic/vue-datepicker/dist/main.css'

const createDefaultInvoice = () :Invoice => {
  return { open: false, date: new Date(), amount: 0, currency: 'EUR'} ;
}

const myDate = ref(new Date())

const invoice :Ref<Invoice> = ref(createDefaultInvoice())

const invoices :Ref<Invoice[]> = ref([])

function restInvoiceToView(data : any) {
 return {...data, open: false, date: new Date(data.date)} as Invoice;
}

const loadInvoices = async () => {
  const url = `/services/invoices`
  const loadedInvoices : any[] = await (await fetch(url)).json()
  invoices.value = loadedInvoices.map(restInvoiceToView)
};

function toggleOpen(invoice: Invoice ) {
  invoice.open = !invoice.open
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
    <table>
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
        <tr v-for="invoice in invoices">
          <td><button @click="() => toggleOpen(invoice)">{{invoice.open ? "V" : ">"}}</button></td>
          <td>{{ formatDate(invoice.date)}}</td>
          <td class="number">{{ invoice.amount }}</td>
          <td>{{ invoice.currency }}</td>
          <td>
            <button @click="() => deleteInvoice(invoice.id)">X</button>
          </td>
        </tr>
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
</style>

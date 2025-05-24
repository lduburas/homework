<script setup lang="ts">
import type { Invoice } from './entities/Invoice'
import { ref, watchEffect } from 'vue'
import type { Ref } from 'vue'

const createDefaultInvoice = () :Invoice => {
  return { date: new Date().toISOString().split('T')[0], amount: 0, currency: 'EUR'} ;
}

const invoice :Ref<Invoice>= ref(createDefaultInvoice())

const invoices :Ref<Invoice[]>= ref([])

const loadInvoices = async () => {
  const url = `/services/invoices`
  invoices.value = await (await fetch(url)).json()
};

function isValid() {
  return true;
}

const createInvoice = async () => {
  if (isValid()) {
    const url = `/services/invoices`
    const body = JSON.stringify(invoice.value)
    const newInvoice : Invoice = await (await fetch(url, {
      method: "POST",
      headers: {
        'Content-Type': 'application/json'
      },
      body 
    })).json()
    if (newInvoice.id) {
      invoices.value.push(newInvoice)
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
          <td></td>
          <td>{{ new Date(invoice.date).toISOString().split('T')[0]}}</td>
          <td class="number">{{ invoice.amount }}</td>
          <td>{{ invoice.currency }}</td>
          <td>
            <button @click="() => deleteInvoice(invoice.id)">X</button>
          </td>
        </tr>
        <tr>
          <td></td>
          <td><input v-model="invoice.date"></td>
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

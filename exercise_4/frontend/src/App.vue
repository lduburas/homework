<script setup lang="ts">
import type { Invoice } from './entities/Invoice'
import { ref, watchEffect } from 'vue'
import type { Ref } from 'vue'

const invoices :Ref<Invoice[]>= ref([])

const loadInvoices = async () => {
  const url = `/services/invoices`
  invoices.value = await (await fetch(url)).json()
};
loadInvoices();

</script>

<template>
  <main>
    <p v-for="invoice in invoices">
      {{ invoice.id + " " +  new Date(invoice.date).toISOString().split('T')[0] + " " + invoice.amount + " " + invoice.currency}}
    </p>
  </main>
</template>

<style scoped>

</style>

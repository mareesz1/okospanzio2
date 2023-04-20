<template>

    <td style="color: white;">{{ table.tableId }}</td>
    <td v-if="table.isOccupied== 1">&#9989;</td>
    <td v-else-if="table.isOccupied==0">&#10060;</td>
</template>

<script setup>
const props = defineProps(['table']);
</script>

<style lang="css" scoped>

</style>
<template>
    <iframe :src="source" style="height:600px;width:100%"></iframe>
</template>

<script>
    export default {
        data(){
            return {
                //source: process.env.VUE_APP_URL //setting the source from env variable
                source: "http://192.168.1.19:8080"
            }
        }
    }
</script>

<template>
    <v-main>
        <v-toolbar
            color="orange"
            elevation="8"
            rounded
        ></v-toolbar>
    <v-container>
        <my-viewer></my-viewer>
    </v-container>
    </v-main>
</template>

<script>
import Header from './components/Header.vue'
import GazeboViewer from './components/GazeboViewer.vue'
    export default {
        name: 'App',
        components:{
            'my-header':Header,
            'my-viewer':GazeboViewer
        }
    }
</script>

<style>
  *{
      box-sizing:border-box;
      margin:0;
  }
</style>
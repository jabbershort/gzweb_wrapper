<template>

<v-app>
  <v-app-bar
      color="blue lighten-1"
      elevation="8"
      dark
      rounded
      height="50"
      max-height="50"
      clipped-right
  >
      <v-toolbar-title>Gazebo Viewer</v-toolbar-title>

  </v-app-bar>
    <Controller></Controller>
  <v-main>
    <v-card elevation="8">
    <GazeboViewer></GazeboViewer>
    </v-card>
  </v-main>
  >
</v-app>
</template>

<script>
import GazeboViewer from './components/GazeboViewer.vue';
import Controller from './components/Controller.vue';
export default {
  name: 'App',

  components: {
    GazeboViewer,
    Controller,
  },

  data() {
    return {
      showController: false,
      controllers: [
        { title: 'Go Home Position',icon: 'mdi-view-dashboard'},
        {title: 'Test Movements',icon: 'mdi-help-box'}
      ]
    }},
};
</script>
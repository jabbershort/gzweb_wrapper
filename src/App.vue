<template>

<v-app>
  <v-app-bar
      color="blue lighten-1"
      elevation="8"
      dark
      rounded
      clipped-right
  >
      <v-toolbar-title>Gazebo Viewer</v-toolbar-title>
      <v-spacer></v-spacer>
      <v-checkbox
        v-model="showController"
        label="Show Controllers"
      >
      </v-checkbox>
            <v-spacer></v-spacer>
  </v-app-bar>
  <v-navigation-drawer 
    v-if="showController"
    app
    right
    dark
    color="blue lighten-1"  
    absolute
  >
    <v-list-item>
      <v-list-item-content>
        <v-list-item-title class="title">
          Covvi Nexus Hand
        </v-list-item-title>
        <v-list-item-subtitle>
          Controller
        </v-list-item-subtitle>
      </v-list-item-content>
    </v-list-item>
    <v-divider></v-divider>
    <v-list
      dense
      nav
    >
    <v-list-item
      v-for="item in controllers"
      :key="item.title"
      link
    >
          <v-list-item-icon>
            <v-icon>{{ item.icon }}</v-icon>
          </v-list-item-icon>

          <v-list-item-content>
            <v-list-item-title>{{ item.title }}</v-list-item-title>
          </v-list-item-content>
        </v-list-item>
      </v-list>

  </v-navigation-drawer>
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
export default {
  name: 'App',

  components: {
    GazeboViewer,
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
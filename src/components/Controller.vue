<template>
  <v-navigation-drawer 
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
    <v-list-item>
        <v-select
            v-model="selectedGrip"
            :items="namesOfGrips"
        >
        </v-select>
    </v-list-item>
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
</template>
<script>
    import ROSLIB from 'roslib';
    export default {
        data(){
            return{
                listOfGrips: [
                    {name:'grip1',id:'0'},
                    {name:'grip2',id:'1'},
                    {name:'grip3',id:'2'}

                ],
                namesOfGrips:[],
                selectedGrip: null,
                ros: new ROSLIB.Ros(),
                controllers: [
                    { title: 'Go Home Position',icon: 'mdi-view-dashboard',function:''},
                    {title: 'Test Movements',icon: 'mdi-help-box'}
                ]
            }
        },
        mounted() {
            this.getConnection();
            this.getGrips();
        },
        methods: {
            getConnection(){
                this.ros = new ROSLIB.Ros();
                this.ros.connect('ws://localhost:9090')
            },
            getGrips(){
                var getGripsClient = new ROSLIB.Service({
                    ros : this.ros,
                    name : '/get_grips',
                    serviceType: 'nexus_driver/GetGrips'
                })

                var request = new ROSLIB.ServiceRequest({
                    returnList: true
                })
                var stringListOfGrips = ""
                getGripsClient.callService(request, function(result){
                    console.log(result.output);
                    stringListOfGrips = result.output
                    //console.log(typeof stringListOfGrips)
                })
                stringListOfGrips = stringListOfGrips.substring(1,stringListOfGrips.length-1)
                console.log(stringListOfGrips)
            },

            selectGrip(){

            },
            openGrip(){

            },
            closeGrip(){

            },
        },
        
    }

</script>


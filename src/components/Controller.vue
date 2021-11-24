<template>
  <v-navigation-drawer 
    app
    right
    dark
    color="blue lighten-1"  
    absolute
    permanent
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
    <v-row 
      justify="center"
      align="center"
      style="height:80px"
    >Select Grip</v-row>
        <v-select
            v-model="selectedGrip"
            :items="namesOfGrips"
            outlined
            rounded
            @change="selectGrip"
        >
        </v-select>
    <v-divider></v-divider>
    <v-row
      style="height:80px"
      justify="center"
      align="center"
    >

      <v-btn
        elevation="2"
        x-large
        @click="openGrip"
        >Open</v-btn>
    </v-row>
    <v-row      
      style="height:80px"    
      align="center"
      justify="center"
      >

      <v-btn
        elevation="2"
        x-large
        @click="closeGrip"
        >Close</v-btn>
    </v-row>
    <v-divider></v-divider>
    <v-row
    justify="center"
    align="center"
    style="height:100px"
    >
      <v-btn
        elevation="2"
        x-large
        @click="testGrips"
        >Test</v-btn>
    </v-row>
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
                namesOfGrips:['grip1','grip2','grip3'],
                selectedGrip:'grip1',
                ros: new ROSLIB.Ros(),
            }
        },
        mounted() {
            this.getConnection();
            this.getGrips();
        },
        computed: {
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
                var gripnames = []
                
                getGripsClient.callService(request, result=>{
                    console.log(result.output);
                    stringListOfGrips = result.output
                    stringListOfGrips = stringListOfGrips.substring(1,stringListOfGrips.length-1)
                    var arrayOfGrips = JSON.parse("["+stringListOfGrips+"]");
                    arrayOfGrips.forEach(element =>{
                        gripnames.push(element.name)
                    })
                    this.namesOfGrips = gripnames
                    this.listOfGrips = arrayOfGrips
                })
            },
            selectGrip(){
              console.log(this.selectedGrip)
              this.openGrip()
            },
            openGrip(){
              var id = null
              this.listOfGrips.forEach(element =>{
                if (element.name == this.selectedGrip)
                id = element.id
              })
              console.log("Selected grip id"+id)
              var sendGripClient = new ROSLIB.Service({
                ros: this.ros,
                name : '/play_grip',
                serviceType : 'nexus_driver/PlayGrip'
              });
              var request = new ROSLIB.ServiceRequest({
                gripID: parseInt(id),
                open: true
              });
              sendGripClient.callService(request, function(result){console.log(result.output)});

            },
            closeGrip(){
              var id = null
              this.listOfGrips.forEach(element =>{
                if (element.name == this.selectedGrip)
                id = element.id
              })
              console.log("Selected grip id"+id)
              var sendGripClient = new ROSLIB.Service({
                ros: this.ros,
                name : '/play_grip',
                serviceType : 'nexus_driver/PlayGrip'
              });
              var request = new ROSLIB.ServiceRequest({
                gripID: parseInt(id),
                open: false
              });
              sendGripClient.callService(request, function(result){console.log(result.output)});

            },
            testGrips(){
              var testGripClient = new ROSLIB.Service({
                ros: this.ros,
                name: '/test_grip',
                serviceType: 'nexus_driver/TestGrips'
              });
              var request = new ROSLIB.ServiceRequest({
                runTest: true
              });
              testGripClient.callService(request,function(result){console.log(result.output)});
            }
        },
        
    }

</script>


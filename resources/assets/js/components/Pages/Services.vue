<template>
    <div>
        <div v-for="item in services">
            <h2 v-text="item['name_'+lang]"></h2>
            <router-link :to="'/services/'+item.slug">{{item['name_'+lang]}}</router-link>
        </div>
    </div>
</template>
<script>
    export default {
        data(){
            return{
                services:[],
                lang:config.locale,
            }
        },
        methods:{
            getData(){
                this.$http.get('/api/services')
                    .then(response=>{
                        this.services = response.data;
                    }), response => { };
            }
        },
        created(){
            this.getData();
        }
    }
</script>
<style lang="less" scoped>
    @import "./../../../less/styles/lesshat.less";
    @import "./../../../less/styles/helpers.less";
    @import "./../../../less/styles/variables.less";
</style>
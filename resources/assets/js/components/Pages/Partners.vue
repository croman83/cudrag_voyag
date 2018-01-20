<template>
    <div>
        <div v-for="item in partners">
            <h2 v-text="item['title_'+lang]"></h2>
            <router-link :to="'/partners/'+item.slug">{{item['title_'+lang]}}</router-link>
        </div>
    </div>
</template>
<script>
    export default {
        data(){
            return{
                partners:[],
                lang:config.locale,
            }
        },
        methods:{
            getData(){
                this.$http.get('/api/partners')
                    .then(response=>{
                        this.partners = response.data;
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
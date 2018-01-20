<template>
    <div class="container">
        <h1 v-text="service.name_ru"></h1>
    </div>
</template>
<script>
    export default {
        data(){
            return{
                service:[],
                lang:config.locale,
            }
        },
        methods:{
            getData(){
                this.$http.get('/api/service/'+this.$route.params.slug)
                    .then(response=>{
                        this.service = response.data;
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
<template>
    <div class="container">
        <h1 v-text="partner.title_ru"></h1>
    </div>
</template>
<script>
    export default {
        data(){
            return{
                partner:[],
                lang:config.locale,
            }
        },
        methods:{
            getData(){
                this.$http.get('/api/partners/'+this.$route.params.slug)
                    .then(response=>{
                        this.partner = response.data;
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
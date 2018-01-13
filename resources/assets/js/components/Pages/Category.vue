<template>
    <div class="cat" v-cloak>
        <loader :show="loader"></loader>
        <h1 class="cat-title">{{data.category.name}}</h1>
        <div class="cat-wrap">
            <div class="cat-left">
                <div class="cat-categories cat-block">
                    <div class="title">
                        <h2>{{ $t('cat.categories') }}</h2>
                    </div>
                    <div class="cat-categories_block">
                        <ul>
                            <li v-for="cat in categories">
                                <router-link :to="'/catalog/'+cat.slug"><span>{{cat.name}}</span></router-link>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="cat-tag cat-block" v-if="data.tag.length">
                    <div class="title">
                        <h2>{{ $t('cat.tags') }}</h2>
                    </div>
                    <div class="cat-tag_block">
                        <ul>
                            <li v-for="tag in data.tag">
                                <svg version="1.1" width="20px" height="20px" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
                                     viewBox="0 0 512 512" style="enable-background:new 0 0 512 512;" xml:space="preserve">
                                    <polygon class="svg1" points="226.4,283.284 134.616,192.636 74.096,259.316 233.48,416.708 512,73.084 444.792,13.812 "/>
                                    <polygon class="svg2" points="274.04,149.996 274.04,109.996 0,109.996 0,498.188 345.88,498.188 345.88,409.204
                                        305.88,409.204 305.88,458.188 40,458.188 40,149.996 "/>
                                </svg>
                                <span>{{ tag.name }}</span>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="cat-right"></div>
        </div>
    </div>
</template>
<script>
    import Loader from './../Elements/Loader.vue';
    import vueUrlParameters from 'vue-url-parameters';
    export default {
        data(){
            return{
                categories:window.config.categories,
                tags:[],
                lang:window.config.locale,
                data:{
                    category:{
                        name:''
                    },
                    tag:[
                        {
                            name:'',
                            id:0
                        }
                    ],
                    searchParams: {
                        filter:[1]
                    },
                },
                loader:false,
                page:1
            }
        },
        mixins: [vueUrlParameters],
        components:{
            Loader
        },
        methods:{
            getData(){
                this.loader = true;
                var data = {
                    categorySlug:this.$route.params.slug,
                    lang:this.lang,
                    filter:this.data.searchParams.filter,
                    page:this.page,

                }
                this.$http.post('/api/products',data)
                    .then(response=>{
                        this.data = response.data;
                        this.loader = false;

                    }), response => { };
            }
        },
        created(){
            this.data.searchParams = this.getFiltersFromUrl(this.data.searchParams);
            this.getData();
//            this.searchParams = this.getFiltersFromUrl(this.searchParams);
            this.updateUrlHash(this.data.searchParams);
        }
    }
</script>
<style scoped lang="less">
    @import "./../../../less/styles/lesshat.less";
    @import "./../../../less/styles/helpers.less";
    @import "./../../../less/styles/variables.less";

    .cat{
        width:@s1400;
        margin:50px auto;
        position: relative;
        &-block{
            .title{
                font-family:@font-gabriela;
                h2{
                    font-size:18px;
                    font-weight:400;
                    cursor:default;
                }
            }
        }
    }


</style>
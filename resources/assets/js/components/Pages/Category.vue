<template>
    <div class="cat" v-cloak>
        <loader :show="loader"></loader>
        <h1 class="cat-title" v-text="data.category.name">{{$t('cat.categories')}}</h1>
        <div class="cat-wrap">
            <div class="cat-left">
                <div class="cat-categories cat-block">
                    <div class="title">
                        <h2>{{ $t('cat.categories') }}</h2>
                    </div>
                    <div class="cat-categories_block">
                        <ul>
                            <li v-for="cat in categories">
                                <router-link :to="'/catalog/'+cat.slug">
                                    <svg version="1.1" width="20px" height="20px" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
                                     viewBox="0 0 512 512" style="enable-background:new 0 0 512 512;" xml:space="preserve">
                                        <polygon class="svg1" points="226.4,283.284 134.616,192.636 74.096,259.316 233.48,416.708 512,73.084 444.792,13.812 "/>
                                        <polygon class="svg2" points="274.04,149.996 274.04,109.996 0,109.996 0,498.188 345.88,498.188 345.88,409.204
                                            305.88,409.204 305.88,458.188 40,458.188 40,149.996 "/>
                                    </svg>
                                    <span>{{cat.name}}</span>
                                </router-link>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="cat-tag cat-block" v-if="data.tag.length && uploaded" v-cloak>
                    <div class="title">
                        <h2>{{ $t('cat.tags') }}</h2>
                    </div>
                    <div class="cat-tag_block">
                        <ul>
                            <li v-for="tag in data.tag">
                                <input :id="'checkbox'+tag.id"
                                       type="checkbox"
                                       hidden
                                       :value="tag.id"
                                       @change="checkTag()"
                                       v-model="data.searchParams.filter">
                                <label :for="'checkbox'+tag.id">
                                    <svg version="1.1" width="20px" height="20px" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
                                     viewBox="0 0 512 512" style="enable-background:new 0 0 512 512;" xml:space="preserve">
                                        <polygon class="svg1" points="226.4,283.284 134.616,192.636 74.096,259.316 233.48,416.708 512,73.084 444.792,13.812 "/>
                                        <polygon class="svg2" points="274.04,149.996 274.04,109.996 0,109.996 0,498.188 345.88,498.188 345.88,409.204
                                            305.88,409.204 305.88,458.188 40,458.188 40,149.996 "/>
                                    </svg>
                                    <span>{{ tag.name }}</span>
                                </label>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="cat-right">
                <div class="cat-filter"></div>
                <h3 class="cat-noproduct" v-if="!data.products.length && uploaded">{{$t('cat.no_products')}}</h3>
                <div class="cat-prod_wrap">
                    <div class="cat-product" v-for="product in data.products">
                        <div class="image">
                            <ramka>
                                <div class="image-in" :style="{'backgroundImage':'url(/storage/'+product.category_image+')'}">
                                    <router-link :to="product.slug ? '/product/'+product.slug : ''"></router-link>
                                </div>
                            </ramka>
                        </div>
                        <div class="title"><router-link :to="product.slug ? '/product/'+product.slug : ''">{{product.name}}</router-link></div>
                        <div class="price" v-if="product.price && product.price > 0">{{ $t('cat.price') }} {{product.price}} l.</div>
                    </div>
                </div>
            </div>
        </div>
        <pagination :count="data.searchParams.page"
                    v-show="data.chunk > 1"
                    @up="pageUp"
                    @down="pageDown"
                    :min="0"
                    ref="paginator"
                    :max="data.chunk"></pagination>
    </div>
</template>
<script>
    import Ramka from './../Elements/Ramka.vue';
    import Loader from './../Elements/Loader.vue';
    import vueUrlParameters from 'vue-url-parameters';
    import Pagination from './../Elements/pagination.vue';
    export default {
        data(){
            return{
                categories:window.config.categories,
                tags:[],
                lang:window.config.locale,
                uploaded:false,
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
                        filter:[],
                        page:1,
                    },
                    chunk:1,
                    products:[],
                },
                loader:false,

            }
        },
        mixins: [vueUrlParameters],
        components:{
            Loader,Ramka,Pagination
        },
        methods:{
            getData(){
                this.loader = true;
                var data = {
                    categorySlug:this.$route.params.slug,
                    lang:this.lang,
                    filter:this.data.searchParams.filter,
                    page:this.data.searchParams.page,

                }
                this.$http.post('/api/products',data)
                    .then(response=>{
                        this.data = response.data;
                        this.loader = false;
                        this.uploaded = true;
                    }), response => { };
            },
            pageUp(){
                this.data.searchParams.page++;
                this.getData();
                this.updateUrlHash(this.data.searchParams);
            },
            pageDown(){
                this.data.searchParams.page--;
                this.getData();
                this.updateUrlHash(this.data.searchParams);
            },
            checkTag(){
                this.data.searchParams.page = 1;
                this.updateUrlHash(this.data.searchParams);
                this.$refs.paginator.num = 1;
                this.getData();
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
        &-title{
            font-size:35px;
            text-align: center;
            font-family: @font-gabriela;
            font-weight:400;
            line-height:1.4;
            margin-bottom:35px;
            min-height:50px;
        }
        &-block{
            margin-bottom:25px;
            .title{
                font-family:@font-gabriela;
                h2{
                    font-size:18px;
                    font-weight:400;
                    cursor:default;
                }
            }
        }
        &-tag{
            &_block{
                ul{
                    list-style: none;
                    margin:0;
                    padding:0;
                    li{
                        margin-bottom: 5px;
                    }
                    label{
                        cursor:pointer;
                        user-select: none;
                        font-size: 15px;
                        font-family: @font-gabriela;
                    }
                    input{
                        &:checked{
                            & + label{
                                svg .svg1{
                                    fill:@color-pink;

                                }
                            }
                        }
                    }
                }
            }
        }
        &-categories{
            &_block{
                ul{
                    list-style: none;
                    margin:0;
                    padding:0;
                    li{
                        margin-bottom:5px;
                        a{
                            font-size:15px;
                            font-family:@font-gabriela;
                            color:@color-base;
                            &.router-link-active{
                                svg .svg1{
                                    fill:@color-pink;
                                }
                            }
                        }
                    }
                }
            }
        }
        &-wrap{
            .flex(row,nowrap,space-between,flex-start);
        }
        &-left{
            width:20%;
        }
        &-right{
            width:77%;
        }
        &-prod_wrap{
            .flex(row,wrap,flex-start,flex-start);
        }
        &-product{
            width:~'calc(100% / 3 - 30px)';
            margin:0 15px 25px 15px;
            .image{
                &-in{
                    background-repeat:no-repeat;
                    height: 300px;
                    background-size:cover;

                    a{
                        display:block;
                        pointer-events: all;
                        height:100%;

                    }
                }
            }
            .title{
                text-align: center;
                margin-bottom:10px;
                line-height:1.3;
                a{
                    color:@color-base;
                    font-size:22px;
                    font-family:@font-gabriela;
                    &:hover{
                        color:@color-pink;
                    }

                }
            }
            .price{
                text-align:center;
                color:@color-base;
                font-family:@font-gabriela;
                font-size:14px;
            }
        }
    }


</style>
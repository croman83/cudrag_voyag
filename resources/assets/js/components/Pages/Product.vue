<template>
    <div>
        <div class="product">
            <!--<breadcrumbs>-->
                <!--<li>-->
                    <!--<router-link to="/category">{{ $t('menu.catalog') }}</router-link>-->
                <!--</li>-->
                <!--<li>-->
                    <!--<router-link :to="{name:'category' , params:{slug:data.cat[0].slug}}">{{ data.cat[0].name }}</router-link>-->
                <!--</li>-->
                <!--<li>-->
                    <!--<span>{{ data.product.name }}</span>-->
                <!--</li>-->
            <!--</breadcrumbs>-->
            <h1 class="product-title">{{ data.product['name_'+lang] }}</h1>
            <slider ref="prslider"></slider>
            <div class="product-description">
                <h4 class="title">{{ $t('description') }}</h4>
                <div class="text" v-html="data.product['description_'+lang]"></div>
                <h4 class="title">{{ $t('price') }}</h4>
                <div class="product-price">
                    <b>{{ data.product.price }}</b>
                    <span>лей/единица</span>
                </div>
                <div class="product-wish">
                    <button @click="setFavorit">
                        <div v-if="inFav">
                            <svg version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
                                 width="38px" height="38px" viewBox="-50 -50 610 610" style="enable-background:new -50 -50 510 510;fill:#ff99cc" xml:space="preserve">
                                <g>
                                    <path d="M255,489.6l-35.7-35.7C86.7,336.6,0,257.55,0,160.65C0,81.6,61.2,20.4,140.25,20.4c43.35,0,86.7,20.4,114.75,53.55
                                        C283.05,40.8,326.4,20.4,369.75,20.4C448.8,20.4,510,81.6,510,160.65c0,96.9-86.7,175.95-219.3,293.25L255,489.6z"/>
                                </g>
                            </svg>
                            <span>{{ $t('added_to_wish') }}</span>
                        </div>
                        <div v-else>
                            <svg version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
                                 width="38px" height="38px" viewBox="-50 -50 610 610" style="enable-background:new -50 -50 510 510;" xml:space="preserve">
                                <g>
                                    <path d="M255,489.6l-35.7-35.7C86.7,336.6,0,257.55,0,160.65C0,81.6,61.2,20.4,140.25,20.4c43.35,0,86.7,20.4,114.75,53.55
                                        C283.05,40.8,326.4,20.4,369.75,20.4C448.8,20.4,510,81.6,510,160.65c0,96.9-86.7,175.95-219.3,293.25L255,489.6z"/>
                                </g>
                            </svg>
                            <span>{{ $t('add_to_wish') }}</span>
                        </div>
                    </button>
                </div>
            </div>
            <div class="product-extra" v-show="data.product['extra_desription_'+lang] !== null" v-html="data.product['extra_description_'+lang]"></div>
        </div>
    </div>
</template>
<script>
    export default {
        data(){
            return{
                lang:window.config.locale,
                favorits:this.$store.state.favorits,
                data:{
                    product:{
                        name_ru:'',
                        price:0,
                        description_ru:'',
                        image:[],
                    }
                }
            }
        },
        head:{
            title:function () {
              return{
                  inner:'CuDrag / ' + this.data.product['seo_title_'+this.lang]
              }
            },
            meta: [
                { name: 'application-name', content: 'CuDrag' }
            ]
        },
        methods:{
            getData(){
                var data = {
                    slug:this.$route.params.slug,
                    lang:this.lang,
                }
                this.$http.post('/api/product',data)
                    .then(response=>{
                        this.data = response.data;
                        this.$emit('updateHead')
                        this.setImages();
                    }), response => { };
            },
            setImages(){
                var arr = JSON.parse(this.data.product.image);
                console.log(arr)
                if(arr && arr.length>1){
                    this.$refs.prslider.images = arr;
                    setTimeout(this.$refs.prslider.initSlider,300);
                }else{
                    setTimeout(function () {
                        var el = document.querySelector('.product-slider');
                        el.style.opacity = 1;
                    },300)
                }

            },
            setFavorit(){
                var fav = localStorage.getItem('favorits') ? JSON.parse(localStorage.getItem('favorits')) : [];
                if(fav.indexOf(this.data.product.id) < 0){
                    fav.push(this.data.product.id);
                    localStorage.setItem('favorits',JSON.stringify(fav));
                }else{
                    let index = fav.indexOf(this.data.product.id);
                    fav.splice(index,1);
                    localStorage.setItem('favorits',JSON.stringify(fav));
                }
                this.$store.commit('changeFavorits',fav)
            }
        },
        components:{
//            breadcrumbs:require('./../Elements/Breadcrumbs.vue'),
            slider:require('./../Elements/ProductSlider.vue')
        },
        computed:{
            inFav(){
                var fav = this.favorits;
                if(fav.indexOf(this.data.product.id) >= 0){
                    return true
                }else{
                    return false
                }
            },
            img(){
//                return JSON.parse(this.data.product.image)
            }
        },
        created(){
            this.getData();
        },
        mounted(){
            var _store = this;
            this.$store.watch(
                function (state) {
                    return state.favorits;
                },
                function () {
                    _store.favorits = _store.$store.state.favorits
                },
                {
                    deep: true
                }
            );
        }
    }
</script>
<style scoped lang="less">
    @import "./../../../less/styles/lesshat.less";
    @import "./../../../less/styles/helpers.less";
    @import "./../../../less/styles/variables.less";
    .product{
        margin-left: auto;
        margin-right: auto;
        margin-top:50px;
        .screen(2px, @s1300,{
            width: 90%;
            padding-left: 15px;
            padding-right: 15px;
            min-width: 270px;
        });
        .screen(@s1300, 9000000px, {
            width: 80%;
            padding-left: 15px;
            padding-right: 15px;
        });
        display: grid;
        grid-template-columns: 1fr 1.5fr;
        grid-template-rows:auto;
        align-content: flex-start;
        &-title{
            font-family: @font-gabriela;
            font-size:35px;
            grid-column:2;
            grid-row:2;
            line-height:1.5;
            font-weight:normal;
        }
        &-description{
            grid-column:2;
            grid-row:3;
            margin-bottom:50px;
            .title{
                font-size:24px;
                font-weight:300;
                line-height:1.1;
                display:inline-block;
                position: relative;
                margin-bottom:1em;
                &:after{
                    content:'';
                    border-bottom:1px solid @color-pink;
                    width:100%;
                    height:0;
                    bottom:-5px;
                    left:0.5em;
                    display: block;
                    position:absolute;
                }
            }
            .text{
                font-size:18px;
                line-height:28px;
                font-weight:300;
                margin-bottom:30px;
            }
        }
        &-price{
            margin:15px 0 25px 0;
            font-family:@font-gabriela;
            font-weight:normal;
            b{
                font-size:30px;
            }
            span{
                font-size:20px;
            }
        }
        &-wish{
            margin:50px 0;
            button{
                background-color: #fff;
                border:1px solid @color-pink;
                outline:none;
                padding:5px 20px;
                font-size:17px;
                font-weight:400;
                color:darken(@color-pink,10%);
                &:hover{
                    background-color: @color-pink;
                    color:#fff;
                    svg{
                        stroke:#fff;
                    }
                }
                &>div{
                    .flex(row,nowrap,center,center);
                }
                svg{
                    fill:white;
                    stroke:@color-pink;
                    stroke-width: 25px;
                    display: block;
                    margin-right:30px;
                    .size(30px);
                }
            }
        }
        &-extra{
            grid-column:1 /span 2;
            grid-row:6;
            margin-bottom:50px;
        }
    }
</style>
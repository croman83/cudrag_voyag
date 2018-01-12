<template>
    <router-link :class="{active:favoritsLength > 0}" class="wish" :to="favoritsLength ? 'favorits' : ''">
        <svg version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
                     width="30px" height="30px" viewBox="-50 -50 610 610" style="enable-background:new -50 -50 510 510;" xml:space="preserve">
                    <g>
                        <path d="M255,489.6l-35.7-35.7C86.7,336.6,0,257.55,0,160.65C0,81.6,61.2,20.4,140.25,20.4c43.35,0,86.7,20.4,114.75,53.55
                            C283.05,40.8,326.4,20.4,369.75,20.4C448.8,20.4,510,81.6,510,160.65c0,96.9-86.7,175.95-219.3,293.25L255,489.6z"/>
                    </g>
                </svg>
        <div class="count" v-if="favoritsLength > 0">{{ favoritsLength }}</div>
    </router-link>
</template>
<script>
    export default {
        data(){
            return{
                favorits:this.$store.state.favorits,
            }
        },
        computed:{
            favoritsLength(){
                return this.favorits.length;
            }
        },
        mounted(){
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

    .wish{
        margin-right:15px;
        cursor: default;
        position: relative;
        &.active{
            svg{
                fill:@color-pink;
            }
        }
        svg{
            fill:#fff;
            stroke:@color-pink;
            stroke-width: 20px;
            cursor: pointer;
            display: block;
        }

    }
    .count{
        position: absolute;
        .size(18px);
        background-color: #fff;
        border:1px solid @color-pink;
        border-radius:50%;
        font-size:11px;
        font-family: @font-gabriela;
        top:-3px;
        right:-8px;
        color:@color-pink;
        .flex(row,nowrap,center,center);
        pointer-events: none;
    }
</style>
<template>
    <div class="header-lang">
        <ul>
            <li v-for="item in langset"
                :class="{active:item === lang}">
                <a :href="'/'+item+'/set-language'">{{item}}</a>
            </li>
        </ul>
    </div>
</template>
<script>
    export default {
        data(){
            return {
                lang: window.config.locale,
                langset:['ru','en','ro']
            }
        }
    }
</script>
<style scoped lang="less">
    @import "./../../../less/styles/lesshat.less";
    @import "./../../../less/styles/helpers.less";
    @import "./../../../less/styles/variables.less";
    ul{
        list-style: none;
        margin:0;
        padding:0;
    }
    li{
        display: inline-block;
        font-family: @font-gabriela;
        padding:0 10px;
        &.active{
            a{
                color:@color-pink;
            }
        }
        a{
            font-size:14px;
            color:black;
            text-transform: uppercase;
        }
    }
</style>
<template>
    <div class="pagination">
        <div class="counter" v-text="num"></div>
        <button class="paginate left" :data-state="num == 1 ? 'disabled' : null" @click="numDown"><i></i><i></i></button>
        <button class="paginate right" :data-state="num == max ? 'disabled' : null" @click="numUp"><i></i><i></i></button>
    </div>
</template>
<script>
    export default {
        props:['count','min','max'],
        data(){
            return {
                num:this.count,
            }
        },
        methods:{
            numUp(){
                if(this.num < this.max){
                    this.num++;
                    this.$emit('up',this.num)
                }
            },
            numDown(){
                if(this.num > 1){
                    this.num--;
                    this.$emit('down',this.num)
                }
            }
        }
    }
</script>
<style scoped lang="less">
    @import "./../../../less/styles/lesshat.less";
    @import "./../../../less/styles/helpers.less";
    @import "./../../../less/styles/variables.less";

    button {
        -webkit-appearance: none;
        background: transparent;
        border: 0;
        outline: 0;
    }
    .pagination{
        position: relative;
        width:120px;
        margin:0 auto;
        padding: 50px 0;
    }
    .paginate {
        position: relative;
        margin: 10px;
        width: 20px;
        height: 20px;
        cursor: pointer;
        transform: translate3d(0, 0, 0);
        position: absolute;
        top: 50%;
        margin-top: -16px;
        -webkit-filter: drop-shadow(0 2px 0px rgba(0, 0, 0, 0.2));
    }
    .paginate i {
        position: absolute;
        top: 40%;
        left: 0;
        width: 20px;
        height: 2px;
        border-radius: 2.5px;
        background: @color-base;
        transition: all 0.15s ease;
    }
    .paginate.left {
        right: 58%;
    }
    .paginate.left i {
        transform-origin: 0% 50%;
    }
    .paginate.left i:first-child {
        transform: translate(0, -1px) rotate(40deg);
    }
    .paginate.left i:last-child {
        transform: translate(0, 1px) rotate(-40deg);
    }
    .paginate.left:hover i:first-child {
        transform: translate(0, -1px) rotate(30deg);
    }
    .paginate.left:hover i:last-child {
        transform: translate(0, 1px) rotate(-30deg);
    }
    .paginate.left:active i:first-child {
        transform: translate(1px, -1px) rotate(25deg);
    }
    .paginate.left:active i:last-child {
        transform: translate(1px, 1px) rotate(-25deg);
    }
    .paginate.left[data-state=disabled] i:first-child {
        transform: translate(-5px, 0) rotate(0deg);
    }
    .paginate.left[data-state=disabled] i:last-child {
        transform: translate(-5px, 0) rotate(0deg);
    }
    .paginate.left[data-state=disabled]:hover i:first-child {
        transform: translate(-5px, 0) rotate(0deg);
    }
    .paginate.left[data-state=disabled]:hover i:last-child {
        transform: translate(-5px, 0) rotate(0deg);
    }
    .paginate.right {
        left: 58%;
    }
    .paginate.right i {
        transform-origin: 100% 50%;
    }
    .paginate.right i:first-child {
        transform: translate(0, 1px) rotate(40deg);
    }
    .paginate.right i:last-child {
        transform: translate(0, -1px) rotate(-40deg);
    }
    .paginate.right:hover i:first-child {
        transform: translate(0, 1px) rotate(30deg);
    }
    .paginate.right:hover i:last-child {
        transform: translate(0, -1px) rotate(-30deg);
    }
    .paginate.right:active i:first-child {
        transform: translate(1px, 1px) rotate(25deg);
    }
    .paginate.right:active i:last-child {
        transform: translate(1px, -1px) rotate(-25deg);
    }
    .paginate.right[data-state=disabled] i:first-child {
        transform: translate(5px, 0) rotate(0deg);
    }
    .paginate.right[data-state=disabled] i:last-child {
        transform: translate(5px, 0) rotate(0deg);
    }
    .paginate.right[data-state=disabled]:hover i:first-child {
        transform: translate(5px, 0) rotate(0deg);
    }
    .paginate.right[data-state=disabled]:hover i:last-child {
        transform: translate(5px, 0) rotate(0deg);
    }
    .paginate[data-state=disabled] {
        opacity: 0.3;
        cursor: default;
    }

    .counter {
        text-align: center;
        position: absolute;
        width: 100%;
        top: 50%;
        margin-top: -15px;
        font-size: 17px;
        font-family: @font-gabriela;
        color:  @color-base;
    }

</style>
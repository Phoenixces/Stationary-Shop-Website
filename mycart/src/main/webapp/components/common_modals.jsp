
<style>
    
    /* Below is css code for toast */

#toast{
    min-width: 300px;
    position: fixed;
    bottom: 50px;
    left: 50%;
    margin-left: -100px;
    background: #333;
    padding: 15px;
    color:white;
    text-align: center;
    z-index: 1;
    font-size:18px;
    visibility: hidden;
    box-shadow: 0px 0px 100px #000;
}

#toast.display{
    visibility: visible;
    animation: fadeIn 0.5s, fadeout 0.5s 2.5s;
    
}

@keyframes fadeIn{
    from{
        bottom:0;
        opacity: 0;
    }
    to{
       bottom:50px;
       opacity:1;
    }
}

@keyframes fadeOut{
    from{
        bottom:50px;
        opacity: 1;
    }
    to{
       bottom:0;
       opacity:0;
    }
}

</style>

<!-- Modal -->
<div class="modal fade" id="cart" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Your Cart</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        
          
          <div class="cart-body">
              
              
          </div>
          
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary checkout-btn text-white" onclick="goToCheckout()">Checkout</button>
      </div>
    </div>
  </div>
</div>

<div id="toast">This is our custom Toast test</div>

##################################################################### #
# CSCB58 Winter 2022 Assembly Final Project
# University of Toronto, Scarborough
#
# Student: Nandhakishore Krishnamurthy Shanthi, 1006565021, krish421, n.krishnamurthy@mail.utoronto.ca #
# Bitmap Display Configuration:
# - Unit width in pixels: 8 (update this as needed)
# - Unit height in pixels: 8 (update this as needed)
# - Display width in pixels: 256 (update this as needed)
# - Display height in pixels: 512 (update this as needed) # - Base Address for Display: 0x10008000 ($gp)
#
# Which milestones have been reached in this submission?
# - Milestone 3
#
# Which approved features have been implemented for milestone 3?
# 1. Health (A)
# 2. Fail condition (B)
# 3. Moving objects (D)
# 4. Moving platforms (E)
# 5. Double jump (K)
#
#
# Link to video demonstration for final submission:
# - https://play.library.utoronto.ca/watch/0da260b225a0133aebccf42f01fefd0c
# - https://play.library.utoronto.ca/watch/fd0454bff55f306f3298e4f350ce8f63
# Are you OK with us sharing the video with people outside course staff?
# - yes 
#
# Any additional information that the TA needs to know:
# - (write here, if any)
# #####################################################################

.eqv 	BASE_ADDRESS	0x10008000
.eqv	Refresh_rate    80
.eqv    Yellow          0xffff00  #Yellow
.eqv 	Red		0xFF0000  #RED	
.eqv    White           0xffffff  #White
.eqv    Purple          0xc900ff  #Purple  
.eqv    Blue           	0x0018ff  #Blue
.eqv	Grey		0x636064  #Grey
.eqv	DRed		0x9d0937  #Dark Red
.eqv	DPurple		0x67099d  #Dark Purple

.data
player:		.word	0x10009034, 0x100090B0, 0x100090B4, 0x100090B8, 0x10009130, 0x10009138		
platform_6:	.word	0x10009690, 0x10009694, 0x10009698, 0x1000969c, 0x100096a0, 0x100096a4		#normal platform of length 6
platform_8:	.word	0x100091a8, 0x100091ac, 0x100091b0, 0x100091b4, 0x100091b8, 0x100091bc, 0x100091c0, 0x100091c4	#normal platform of length 8
platform_7:	.word	0x10009964, 0x10009968, 0x1000996C, 0x10009970, 0x10009974, 0x10009978, 0x1000997C		#normal platform of length 7
platform_3:	.word	0x10008cd0, 0x10008cd4, 0x10008cd8						#normal platform of length 3
obstacle_s:	.word	0x10008fd0, 0x10008fd4, 0x10009050, 0x10008054
obstacle_sq:	.word	0x10008280, 0x10008284, 0x10009288, 0x10008772
obstacle_sq2:	.word	0x10008794, 0x10008798, 0x10008814, 0x10008818


.text
.globl main
main: 
	
Init:	#Initializing starter map
	li $t0, BASE_ADDRESS	# $t0 stores the base address for display
	#Iitializing Red line at bottom
	li $t1, Red		#Red 
	sw $t1, 7040($t0)
	sw $t1, 7044($t0)
	sw $t1, 7048($t0)
	sw $t1, 7052($t0)
	sw $t1, 7056($t0)
	sw $t1, 7060($t0)
	sw $t1, 7064($t0)
	sw $t1, 7068($t0)
	sw $t1, 7072($t0)
	sw $t1, 7076($t0)
	sw $t1, 7080($t0)
	sw $t1, 7084($t0)
	sw $t1, 7088($t0)
	sw $t1, 7092($t0)
	sw $t1, 7096($t0)
	sw $t1, 7100($t0)
	sw $t1, 7104($t0)
	sw $t1, 7108($t0)
	sw $t1, 7112($t0)
	sw $t1, 7116($t0)
	sw $t1, 7120($t0)
	sw $t1, 7124($t0)
	sw $t1, 7128($t0)
	sw $t1, 7132($t0)
	sw $t1, 7136($t0)
	sw $t1, 7140($t0)
	sw $t1, 7144($t0)
	sw $t1, 7148($t0)
	sw $t1, 7152($t0)
	sw $t1, 7156($t0)
	sw $t1, 7160($t0)
	sw $t1, 7164($t0)
	
	#Initialize Platform_6
	li $t1, White		#White 
	sw $t1, 5776($t0)
	sw $t1, 5780($t0)
	sw $t1, 5784($t0)
	sw $t1, 5788($t0)
	sw $t1, 5792($t0)
	sw $t1, 5796($t0)
	la $t4, platform_6
	addi $t5, $gp, 5776
        sw $t5, 0($t4) 		#Unit 1
        addi $t5, $gp, 5780
        sw $t5, 4($t4) 		#Unit 2, 
        addi $t5, $gp, 5784
        sw $t5, 8($t4) 		#Unit 3
        addi $t5, $gp, 5788
        sw $t5, 12($t4) 	#Unit 4
        addi $t5, $gp, 5792
        sw $t5, 16($t4) 	#Unit 5
        addi $t5, $gp, 5796
        sw $t5, 20($t4) 	#Unit 6
	
	#Initialize Platform_8
	sw $t1, 4520($t0)
	sw $t1, 4524($t0)
	sw $t1, 4528($t0)
	sw $t1, 4532($t0)
	sw $t1, 4536($t0)
	sw $t1, 4540($t0)
	sw $t1, 4544($t0)
	sw $t1, 4548($t0)
	la $t4, platform_8
	addi $t5, $gp, 4520
        sw $t5, 0($t4) 		#Unit 1
        addi $t5, $gp, 4524
        sw $t5, 4($t4) 		#Unit 2
        addi $t5, $gp, 4528
        sw $t5, 8($t4) 		#Unit 3
        addi $t5, $gp, 4532
        sw $t5, 12($t4) 	#Unit 4
        addi $t5, $gp, 4536
        sw $t5, 16($t4) 	#Unit 5
        addi $t5, $gp, 4540
        sw $t5, 20($t4) 	#Unit 6
        addi $t5, $gp, 4544
        sw $t5, 24($t4) 	#Unit 7
        addi $t5, $gp, 4548
        sw $t5, 28($t4) 	#Unit 8
        
        #Initialize Platform_7
	sw $t1, 6500($t0)
	sw $t1, 6504($t0)
	sw $t1, 6508($t0)
	sw $t1, 6512($t0)
	sw $t1, 6516($t0)
	sw $t1, 6520($t0)
	sw $t1, 6524($t0)
	la $t4, platform_7
	addi $t5, $gp, 6500
        sw $t5, 0($t4) 		#Unit 1
        addi $t5, $gp, 6504
        sw $t5, 4($t4) 		#Unit 2
        addi $t5, $gp, 6508
        sw $t5, 8($t4) 		#Unit 3
        addi $t5, $gp, 6512
        sw $t5, 12($t4) 	#Unit 4
        addi $t5, $gp, 6516
        sw $t5, 16($t4) 	#Unit 5
        addi $t5, $gp, 6520
        sw $t5, 20($t4) 	#Unit 6
        addi $t5, $gp, 6524
        sw $t5, 24($t4) 	#Unit 7
	
	#Initialize Platform_3
	sw $t1, 3280($t0)
	sw $t1, 3284($t0)
	sw $t1, 3288($t0)
	la $t4, platform_3
	addi $t5, $gp, 3280
        sw $t5, 0($t4) 		#Unit 1
        addi $t5, $gp, 3284
        sw $t5, 4($t4) 		#Unit 2, 
        addi $t5, $gp, 3288
        sw $t5, 8($t4) 		#Unit 3
	
	#Initialize Player
	li $t2, Blue		#Blue 
	li $t1, Purple  	#Purple
        li $t3, Yellow 		#Yellow
	sw $t3, 4148($t0)	#Head
	sw $t1, 4272($t0)
	sw $t2, 4276($t0)
	sw $t1, 4280($t0)
	sw $t2, 4400($t0)	#Tail
	sw $t2, 4408($t0)	#Tail
	la $t4, player
        addi $t5, $gp, 4148
        sw $t5, 0($t4) 		#Unit 1, Head
        addi $t5, $gp, 4272
        sw $t5, 4($t4) 		#Unit 2, Left Purple
        addi $t5, $gp, 4276
        sw $t5, 8($t4) 		#Unit 3, Centre Blue
        addi $t5, $gp, 4280
        sw $t5, 12($t4) 	#Unit 4, RIght Purple
        addi $t5, $gp, 4400
        sw $t5, 16($t4) 	#Unit 5, Tail Left
        addi $t5, $gp, 4408
        sw $t5, 20($t4) 	#Unit 6, Tail Right
        
        #Initialize obstacle_sq
        la $t4, obstacle_sq
        li $t2, DRed		#Dark Red 
	li $t1, DPurple  	#Dark Purple        				
        sw $t1, 4048($t0)
        sw $t2, 4052($t0)
        sw $t2, 4176($t0)
        sw $t1, 4180($t0)
        addi $t5, $gp, 4048
        sw $t5, 0($t4) 		#Unit 1, Top Left
        addi $t5, $gp, 4052
        sw $t5, 4($t4) 		#Unit 2, Top Right
        addi $t5, $gp, 4176
        sw $t5, 8($t4) 		#Unit 3, Bottom Left
        addi $t5, $gp, 4180
        sw $t5, 12($t4) 	#Unit 4, Bottom Right
        
        #Initialize obstacle_s	
        la $t4, obstacle_s
        li $t2, DRed		#Dark Red 
	li $t1, DPurple  	#Dark Purple        				
        sw $t2, 640($t0)
        sw $t1, 644($t0)
        sw $t2, 648($t0)
        sw $t2, 772($t0)
        addi $t5, $gp, 640
        sw $t5, 0($t4) 		#Unit 1, Top Left
        addi $t5, $gp, 644
        sw $t5, 4($t4) 		#Unit 2, Top Middle
        addi $t5, $gp, 648
        sw $t5, 8($t4) 		#Unit 3, Top Left
        addi $t5, $gp, 772
        sw $t5, 12($t4) 	#Unit 4, Bottom 

	#Initialize obstacle_sq2
        la $t4, obstacle_sq2
        li $t2, DRed		#Dark Red 
	li $t1, DPurple  	#Dark Purple        				
        sw $t1, 1940($t0)
        sw $t2, 1944($t0)
        sw $t2, 2068($t0)
        sw $t1, 2072($t0)
        addi $t5, $gp, 1940
        sw $t5, 0($t4) 		#Unit 1, Top Left
        addi $t5, $gp, 1944
        sw $t5, 4($t4) 		#Unit 2, Top Middle
        addi $t5, $gp, 2068
        sw $t5, 8($t4) 		#Unit 3, Top Left
        addi $t5, $gp, 2072
        sw $t5, 12($t4) 	#Unit 4, Bottom 

        
        #Initialize health
        li $t1, Red 
       
        sw $t1, 7688($gp) #Health 3
        sw $t1, 7696($gp)
        sw $t1, 7820($gp) 
        sw $t1, 7704($gp) #Health 2
        sw $t1, 7712($gp)
        sw $t1, 7836($gp)
        sw $t1, 7720($gp) #Health 1
        sw $t1, 7728($gp)
        sw $t1, 7852($gp) 

	li $s0, 0xffff0000	#Address of keystroke event
        la $s1, player		#Address of player
        li $s2, 3 		#Health
        li $s3, Refresh_rate 	#Refresh Rate
        li $s4, 0 		#Play time
	li $s6, 0 		#jump flag 
	li $s7, 0 		#jump flag        
        
###########################################################
main_loop:	#Main Loop of the Game
	
	#key_update(int[] player, int *keystroke_event)
        add $a3, $s1, $zero
        add $a1, $s0, $zero
        jal key_update
        li $s7, 0
        
        #find_crash(int[] player, int health)
        add $a3, $s1, $zero
        add $a2, $s2, $zero
        jal find_crash
 loop3: addi $s2, $v1, 0

	beq $s2, 0, game_over

        #call gravity(int[] player) to move player downwards
	jal gravity
	
	#calling plat_move() to move the platforms
        jal plat_move
      
        
loop2:        
        #Sleep for 80ms
Refresh:li $v0, 32
        add $a0, $s3, $zero
        syscall
       
        j main_loop
        
        
#################################################
# This section is the key_update() function
# void key_update(int[] player_address, int *keystroke_event)
#################################################
key_update: #check whether the user has pressed any key
        lw $t4, 0($a1)
        beq $t4, 1, k_event
        
key_re: jr $ra #Return from key_update() function

k_event:    #Branch to correponding keystroke event
	lw $t5, 4($a1)
        li $t7, Blue		#Blue 
	li $t8, Purple  	#Purple
        li $t9, Yellow 		#Yellow
	beq $t5, 0x70, p_restart	#p pressed to restart
        beq $s2, -1, key_re
        beq $t5, 0x61, a_pressed	#move left
	beq $t5, 0x64, d_pressed	#move right
	li $t6, 0
	beq $t5, 0x77, w_pressed	#jump up

        j key_re


a_pressed:	#a pressed: moving left
        #check whether the player has reached the left most
        lw $t0, 16($a3)  #5th unit
        li $t1, 128
        div $t0, $t1
        mfhi $t1
        beq $t1, 0, key_re
	#update the new location for the player
	lw $t0, 0($a3)  #1st unit
	sw $zero, 0($t0)
	addi $t0, $t0, -4
        sw $t9, 0($t0)
        sw $t0, 0($a3)
        lw $t0, 4($a3) #2nd unit
        sw $zero, 0($t0)
        addi $t0, $t0, -4
        sw $t8, 0($t0)
        sw $t0, 4($a3)
        lw $t0, 8($a3) #3rd unit
        addi $t0, $t0, -4
        sw $t7, 0($t0)
        sw $t0, 8($a3)
        lw $t0, 12($a3) #4th unit
        sw $zero, 0($t0)
        addi $t0, $t0, -4
        sw $t8, 0($t0)
        sw $t0, 12($a3)
        lw $t0, 16($a3) #5th unit
        sw $zero, 0($t0)
        addi $t0, $t0, -4
        sw $t7, 0($t0)
        sw $t0, 16($a3)
        lw $t0, 20($a3) #6th unit
        sw $zero, 0($t0)
        addi $t0, $t0, -4
        sw $t7, 0($t0)
        sw $t0, 20($a3)
        j key_re



d_pressed: 	#d pressed: moving right
        #check whether the player has reached the right most
        lw $t0, 12($a3)  #6th unit
        li $t1, 128
        div $t0, $t1
        mfhi $t1
        beq $t1, 124, key_re
	#update the new location for the player
	lw $t0, 0($a3)  #1st unit
	sw $zero, 0($t0)
	addi $t0, $t0, 4
        sw $t9, 0($t0)
        sw $t0, 0($a3)
        lw $t0, 4($a3) #2nd unit
        sw $zero, 0($t0)
        addi $t0, $t0, 4
        sw $t8, 0($t0)
        sw $t0, 4($a3)
        lw $t0, 8($a3) #3rd unit
        addi $t0, $t0, 4
        sw $t7, 0($t0)
        sw $t0, 8($a3)
        lw $t0, 12($a3) #4th unit
        addi $t0, $t0, 4
        sw $t8, 0($t0)
        sw $t0, 12($a3)
        lw $t0, 16($a3) #5th unit
        sw $zero, 0($t0)
        addi $t0, $t0, 4
        sw $t7, 0($t0)
        sw $t0, 16($a3)
        lw $t0, 20($a3) #6th unit
        sw $zero, 0($t0)
        addi $t0, $t0, 4
        sw $t7, 0($t0)
        sw $t0, 20($a3)
        j key_re
        
    
w_pressed: 	#d pressed: moving right
        
        beq $s6, 2, key_re
        addi $s6, $s6, 1
	#update the new location for the player
w_p2:	li $s7, 1
	#redraw sq 
	la $t2, obstacle_sq #Address of obstacle_sq
	li $t8, DRed  	#Purple
        li $t9, DPurple 		#Yellow
	lw $t3, 0($t2) #Unit 1
        sw $t9, 0($t3)
        sw $t3, 0($t2)
        lw $t3, 4($t2) #Unit2
        sw $t8, 0($t3)
        sw $t3, 4($t2)
        lw $t3, 8($t2) #Unit3
        sw $t8, 0($t3)
        sw $t3, 8($t2)
        lw $t3, 12($t2) #Unit4
        sw $t9, 0($t3)
        sw $t3, 12($t2)
        #redraw s
        la $t2, obstacle_s
        lw $t3, 0($t2) #Unit 1
        sw $t9, 0($t3)
        sw $t3, 0($t2)
        lw $t3, 4($t2) #Unit2
        sw $t8, 0($t3)
        sw $t3, 4($t2)
        lw $t3, 8($t2) #Unit3
        sw $t9, 0($t3)
        sw $t3, 8($t2)
        lw $t3, 12($t2) #Unit4
        sw $t9, 0($t3)
        sw $t3, 12($t2)
        #redraw sq2
        la $t2, obstacle_sq2 #Address of obstacle_sq
	li $t8, DRed  	#Purple
        li $t9, DPurple 		#Yellow
	lw $t3, 0($t2) #Unit 1
        sw $t9, 0($t3)
        sw $t3, 0($t2)
        lw $t3, 4($t2) #Unit2
        sw $t8, 0($t3)
        sw $t3, 4($t2)
        lw $t3, 8($t2) #Unit3
        sw $t8, 0($t3)
        sw $t3, 8($t2)
        lw $t3, 12($t2) #Unit4
        sw $t9, 0($t3)
        sw $t3, 12($t2)
	j find_crash
w_p3:	lw $t5, 4($a1)
        li $t7, Blue		#Blue 
	li $t8, Purple  	#Purple
        li $t9, Yellow 		#Yellow
	lw $t0, 0($a3)  #1st unit
	sw $zero, 0($t0)
	addi $t0, $t0, -128
        sw $t9, 0($t0)
        sw $t0, 0($a3)
        lw $t0, 4($a3) #2nd unit
        sw $zero, 0($t0)
        addi $t0, $t0, -128
        sw $t8, 0($t0)
        sw $t0, 4($a3)
        lw $t0, 8($a3) #3rd unit
        sw $zero, 0($t0)
        addi $t0, $t0, -128
        sw $t7, 0($t0)
        sw $t0, 8($a3)
        lw $t0, 12($a3) #4th unit
        sw $zero, 0($t0)
        addi $t0, $t0, -128
        sw $t8, 0($t0)
        sw $t0, 12($a3)
        lw $t0, 16($a3) #5th unit
        sw $zero, 0($t0)
        addi $t0, $t0, -128
        sw $t7, 0($t0)
        sw $t0, 16($a3)
        lw $t0, 20($a3) #6th unit
        sw $zero, 0($t0)
        addi $t0, $t0, -128
        sw $t7, 0($t0)
        sw $t0, 20($a3)
        add $t6, $t6, 1
        beq $t6, 15, key_re
        
        j w_p2
        
jumping:
	j key_re


p_restart: 	#Restart the game
	jal delete_all
	j Init 


#########################################################
# This is a private function that delete all the player, platforms and obstacles
# delete_all()
############################################################
delete_all: #Delete all the objects in the game
	la $t1, player
        lw $t1, 0($t1)
        la $t2, platform_6
        lw $t2, 0($t2)
        la $t3, platform_8
        lw $t3, 0($t3)
        la $t4, platform_3
        lw $t4, 0($t4)
        la $t5, obstacle_s
        lw $t5, 0($t5)
        la $t6, obstacle_sq
        lw $t6, 0($t6)
        la $t7, obstacle_sq2
        lw $t7, 0($t7)
        la $t8, platform_7
        lw $t8, 0($t8)
        
        #delete player
        sw $zero, 0($t1)
        sw $zero, 124($t1)
        sw $zero, 128($t1)
        sw $zero, 132($t1)
        sw $zero, 252($t1)
        sw $zero, 260($t1)
        
        #delete platform 6
        sw $zero, 0($t2)
        sw $zero, 4($t2)
        sw $zero, 8($t2)
        sw $zero, 12($t2)
        sw $zero, 16($t2)
        sw $zero, 20($t2)
        
        #delete platform 8
        sw $zero, 0($t3)
        sw $zero, 4($t3)
        sw $zero, 8($t3)
        sw $zero, 12($t3)
        sw $zero, 16($t3)
        sw $zero, 20($t3)
        sw $zero, 24($t3)
        sw $zero, 28($t3)
        
        #delete platform 3
        sw $zero, 0($t4)
        sw $zero, 4($t4)
        sw $zero, 8($t4)
        
        #delete obstacle_s
        sw $zero, 0($t5)
        sw $zero, 4($t5)
        sw $zero, 8($t5)
        sw $zero, 132($t5)
        
        #delete obstacle_sq
        sw $zero, 0($t6)
        sw $zero, 4($t6)
        sw $zero, 128($t6)
        sw $zero, 132($t6)
        
        #delete obstacle_sq2
        sw $zero, 0($t7)
        sw $zero, 4($t7)
        sw $zero, 128($t7)
        sw $zero, 132($t7)
        
        #delete platform 7
        sw $zero, 0($t8)
        sw $zero, 4($t8)
        sw $zero, 8($t8)
        sw $zero, 12($t8)
        sw $zero, 16($t8)
        sw $zero, 20($t8)
        sw $zero, 24($t8)
	
	jr $ra



###################################################
# This function is the paltforms_move() function
# void paltforms_move()
###################################################
plat_move:	#Move the platforms from right to left. If one is deleted, generate a new one
        la $t2, platform_6 #Address of platform_6
        la $t1, platform_8 #Address of platform_8
        la $t0, platform_3 #Address of platform_3
        la $t6, obstacle_s #Address of obstacle_2
        li $t7, White
        li $t8, DRed
        li $t9, DPurple
	li $t4, 128
        
        jal move_6
	jal move_8
	jal move_7
        jal move_3
        jal move_s
	jal redraw_sq
        j loop2


move_s: 
	lw $t3, 0($t6) #Unit 1
        div $t3, $t4
        mfhi $t5
        beq $t5, 0, move_sq_right
        
        lw $t3, 0($t6) #Unit 1
        addi $t3, $t3, -4
        sw $t9, 0($t3)
        sw $t3, 0($t6)
        lw $t3, 4($t6) #Unit2
        addi $t3, $t3, -4
        sw $t8, 0($t3)
        sw $t3, 4($t6)
        lw $t3, 8($t6) #Unit3
        sw $zero, 0($t3)
        addi $t3, $t3, -4
        sw $t9, 0($t3)
        sw $t3, 8($t6)
        lw $t3, 12($t6) #Unit4
        sw $zero, 0($t3)
        addi $t3, $t3, -4
        sw $t9, 0($t3)
        sw $t3, 12($t6)
       	jr $ra


 move_sq_right:
        
        lw $t3, 0($t6) #Unit 1
        sw $zero, 0($t3)
        addi $t3, $t3, 116
        sw $t9, 0($t3)
        sw $t3, 0($t6)
        lw $t3, 4($t6) #Unit2
        sw $zero, 0($t3)
        addi $t3, $t3, 116
        sw $t8, 0($t3)
        sw $t3, 4($t6)
        lw $t3, 8($t6) #Unit3
        sw $zero, 0($t3)
        addi $t3, $t3, 116
        sw $t9, 0($t3)
        sw $t3, 8($t6)
        lw $t3, 12($t6) #Unit4
        sw $zero, 0($t3)
        addi $t3, $t3, 116
        sw $t9, 0($t3)
        sw $t3, 12($t6)
       	jr $ra

	
redraw_sq:
	la $t6, obstacle_sq #Address of obstacle_sq
	lw $t3, 0($t6) #Unit 1
        sw $t9, 0($t3)
        sw $t3, 0($t6)
        lw $t3, 4($t6) #Unit2
        sw $t8, 0($t3)
        sw $t3, 4($t6)
        lw $t3, 8($t6) #Unit3
        sw $t8, 0($t3)
        sw $t3, 8($t6)
        lw $t3, 12($t6) #Unit4
        sw $t9, 0($t3)
        sw $t3, 12($t6)
        
        la $t6, obstacle_sq2 #Address of obstacle_sq
	lw $t3, 0($t6) #Unit 1
        sw $t9, 0($t3)
        sw $t3, 0($t6)
        lw $t3, 4($t6) #Unit2
        sw $t8, 0($t3)
        sw $t3, 4($t6)
        lw $t3, 8($t6) #Unit3
        sw $t8, 0($t3)
        sw $t3, 8($t6)
        lw $t3, 12($t6) #Unit4
        sw $t9, 0($t3)
        sw $t3, 12($t6)
        
       	jr $ra	
        
 move_6:
        
        lw $t3, 0($t2) #Unit 1
        div $t3, $t4
        mfhi $t5
        beq $t5, 0, new_p6
        
        addi $t3, $t3, -4
        sw $t7, 0($t3)
        sw $t3, 0($t2)
        lw $t3, 4($t2) #Unit2
        addi $t3, $t3, -4
        sw $t7, 0($t3)
        sw $t3, 4($t2)
        lw $t3, 8($t2) #Unit3
        addi $t3, $t3, -4
        sw $t7, 0($t3)
        sw $t3, 8($t2)
        lw $t3, 12($t2) #Unit4
        addi $t3, $t3, -4
        sw $t7, 0($t3)
        sw $t3, 12($t2)
        lw $t3, 16($t2) #Unit 5
        addi $t3, $t3, -4        
        sw $t7, 0($t3)
        sw $t3, 16($t2)
        lw $t3, 20($t2) #Unit 6
        sw $zero, 0($t3)
        addi $t3, $t3, -4
        sw $t7, 0($t3)
        sw $t3, 20($t2)
       	jr $ra
       	
 
  move_8:
        
        lw $t3, 0($t1) #Unit 1
        div $t3, $t4
        mfhi $t5
        beq $t5, 0, new_p8
        
        addi $t3, $t3, -4
        sw $t7, 0($t3)
        sw $t3, 0($t1)
        lw $t3, 4($t1) #Unit2
        addi $t3, $t3, -4
        sw $t7, 0($t3)
        sw $t3, 4($t1)
        lw $t3, 8($t1) #Unit3
        addi $t3, $t3, -4
        sw $t7, 0($t3)
        sw $t3, 8($t1)
        lw $t3, 12($t1) #Unit4
        addi $t3, $t3, -4
        sw $t7, 0($t3)
        sw $t3, 12($t1)
        lw $t3, 16($t1) #Unit 5
        addi $t3, $t3, -4        
        sw $t7, 0($t3)
        sw $t3, 16($t1)
        lw $t3, 20($t1) #Unit 6
        addi $t3, $t3, -4
        sw $t7, 0($t3)
        sw $t3, 20($t1)
        lw $t3, 24($t1) #Unit 7
        addi $t3, $t3, -4
        sw $t7, 0($t3)
        sw $t3, 24($t1)
        lw $t3, 28($t1) #Unit 8
        sw $zero, 0($t3)
        addi $t3, $t3, -4
        sw $t7, 0($t3)
        sw $t3, 28($t1)
       	jr $ra
       	
  move_7:
        la $t1, platform_7 #Address of platform_8
        lw $t3, 0($t1) #Unit 1
        div $t3, $t4
        mfhi $t5
        beq $t5, 0, new_p7
        
        addi $t3, $t3, -4
        sw $t7, 0($t3)
        sw $t3, 0($t1)
        lw $t3, 4($t1) #Unit2
        addi $t3, $t3, -4
        sw $t7, 0($t3)
        sw $t3, 4($t1)
        lw $t3, 8($t1) #Unit3
        addi $t3, $t3, -4
        sw $t7, 0($t3)
        sw $t3, 8($t1)
        lw $t3, 12($t1) #Unit4
        addi $t3, $t3, -4
        sw $t7, 0($t3)
        sw $t3, 12($t1)
        lw $t3, 16($t1) #Unit 5
        addi $t3, $t3, -4        
        sw $t7, 0($t3)
        sw $t3, 16($t1)
        lw $t3, 20($t1) #Unit 6
        addi $t3, $t3, -4
        sw $t7, 0($t3)
        sw $t3, 20($t1)
        lw $t3, 24($t1) #Unit 7
        sw $zero, 0($t3)
        addi $t3, $t3, -4
        sw $t7, 0($t3)
        sw $t3, 24($t1)
        lw $t3, 28($t1) #Unit 8
       	jr $ra      
       	
       	
       	
 move_3:
        
        lw $t3, 0($t0) #Unit 1
        div $t3, $t4
        mfhi $t5
        beq $t5, 0, new_p3
        
        addi $t3, $t3, -4
        sw $t7, 0($t3)
        sw $t3, 0($t0)
        lw $t3, 4($t0) #Unit2
        addi $t3, $t3, -4
        sw $t7, 0($t3)
        sw $t3, 4($t0)
        lw $t3, 8($t0) #Unit3
        sw $zero, 0($t3)
        addi $t3, $t3, -4
        sw $t7, 0($t3)
        sw $t3, 8($t0)
       	jr $ra
        
	
	# Generate a new platofrm_6
new_p6:	
	sw $zero, 0($t3)
        sw $zero, 4($t3)
        sw $zero, 8($t3)
        sw $zero, 12($t3)
        sw $zero, 16($t3)
        sw $zero, 20($t3)
        
        li $v0, 42
        li $a0, 30	#random y value
        li $a1, 53
        syscall 
        
	mul $t3, $a0, 32
	addi $t3, $t3, 26
	mul $t3, $t3, 4
	add $t3, $t3, $gp
	
	sw $t3, 0($t2)	#Unit 1
        sw $t7, 0($t3)
        add $t3, $t3, 4	#Unit 2
        sw $t3, 4($t2)
        sw $t7, 0($t3)
        add $t3, $t3, 4	#Unit 3
        sw $t3, 8($t2)
        sw $t7, 0($t3)
        add $t3, $t3, 4	#Unit 4
        sw $t3, 12($t2)
        sw $t7, 0($t3)  
        add $t3, $t3, 4	#Unit 5
        sw $t3, 16($t2)
        sw $t7, 0($t3) 
        add $t3, $t3, 4	#Unit 6
        sw $t3, 20($t2)
        sw $t7, 0($t3)      
        jr $ra
        
        
        # Generate a new platofrm_8
new_p8:	
	sw $zero, 0($t3)
        sw $zero, 4($t3)
        sw $zero, 8($t3)
        sw $zero, 12($t3)
        sw $zero, 16($t3)
        sw $zero, 20($t3)
        sw $zero, 24($t3)
        sw $zero, 28($t3)
        
        li $v0, 42
        li $a0, 0	#random y value
        li $a1, 53
        syscall 
	mul $t3, $a0, 32
	addi $t3, $t3, 26
	mul $t3, $t3, 4
	add $t3, $t3, $gp
	
	sw $t3, 0($t1)	#Unit 1
        sw $t7, 0($t3)
        add $t3, $t3, 4	#Unit 2
        sw $t3, 4($t1)
        sw $t7, 0($t3)
        add $t3, $t3, 4	#Unit 3
        sw $t3, 8($t1)
        sw $t7, 0($t3)
        add $t3, $t3, 4	#Unit 4
        sw $t3, 12($t1)
        sw $t7, 0($t3)  
        add $t3, $t3, 4	#Unit 5
        sw $t3, 16($t1)
        sw $t7, 0($t3) 
        add $t3, $t3, 4	#Unit 6
        sw $t3, 20($t1)
        sw $t7, 0($t3)   
        add $t3, $t3, 4	#Unit 7
        sw $t3, 24($t1)
        sw $t7, 0($t3)
        add $t3, $t3, 4	#Unit 8
        sw $t3, 28($t1)
        sw $t7, 0($t3)   
        jr $ra


	 # Generate a new platofrm_7
new_p7:	
	sw $zero, 0($t3)
        sw $zero, 4($t3)
        sw $zero, 8($t3)
        sw $zero, 12($t3)
        sw $zero, 16($t3)
        sw $zero, 20($t3)
        sw $zero, 24($t3)
        
        li $v0, 42
        li $a0, 0	#random y value
        li $a1, 53
        syscall 
	mul $t3, $a0, 32
	addi $t3, $t3, 26
	mul $t3, $t3, 4
	add $t3, $t3, $gp
	
	sw $t3, 0($t1)	#Unit 1
        sw $t7, 0($t3)
        add $t3, $t3, 4	#Unit 2
        sw $t3, 4($t1)
        sw $t7, 0($t3)
        add $t3, $t3, 4	#Unit 3
        sw $t3, 8($t1)
        sw $t7, 0($t3)
        add $t3, $t3, 4	#Unit 4
        sw $t3, 12($t1)
        sw $t7, 0($t3)  
        add $t3, $t3, 4	#Unit 5
        sw $t3, 16($t1)
        sw $t7, 0($t3) 
        add $t3, $t3, 4	#Unit 6
        sw $t3, 20($t1)
        sw $t7, 0($t3)   
        add $t3, $t3, 4	#Unit 7
        sw $t3, 24($t1)
        sw $t7, 0($t3)
        jr $ra

	# Generate a new platofrm_3
new_p3:	
	sw $zero, 0($t3)
        sw $zero, 4($t3)
        sw $zero, 8($t3)
        
        li $v0, 42
        li $a0, 0	#random y value
        li $a1, 53
        syscall 
	mul $t3, $a0, 32
	addi $t3, $t3, 26
	mul $t3, $t3, 4
	add $t3, $t3, $gp
	
	sw $t3, 0($t0)	#Unit 1
        sw $t7, 0($t3)
        add $t3, $t3, 4	#Unit 2
        sw $t3, 4($t0)
        sw $t7, 0($t3)
        add $t3, $t3, 4	#Unit 3
        sw $t3, 8($t0)
        sw $t7, 0($t3)     
        jr $ra
        
        
        
#####################################################
# This function check whether the player has collided with an obstalce. If yes, the player will lose 1 health
# find_crash(int[] player, int health)
####################################################
find_crash:
	lw $t3, 0($a3)
        li $v0, 0
        addi $v1, $a2, 0
        li $t8, DRed
        li $t9, DPurple
        
        #Branch to is_crashed if any unit of the player has collision with obstacles
        lw $t4, 0($t3) #Check unit 1
        beq $t4, DRed, has_collided
        beq $t4, DPurple, has_collided
        add $t4, $t4, -128
        beq $t4, DRed, has_collided
        beq $t4, DPurple, has_collided
        lw $t4, 124($t3) #Check unit 2
        beq $t4, DRed, has_collided
        beq $t4, DPurple, has_collided
        add $t4, $t4, -128
        beq $t4, DRed, has_collided
        beq $t4, DPurple, has_collided
        lw $t4, 128($t3) #Check unit 3
        beq $t4, DRed, has_collided
        beq $t4, DPurple, has_collided
        lw $t4, 132($t3) #Check unit 4
        beq $t4, DRed, has_collided
        beq $t4, DPurple, has_collided
        add $t4, $t4, -128
        beq $t4, DRed, has_collided
        beq $t4, DPurple, has_collided
        lw $t4, 252($t3) #Check unit 5
        beq $t4, DRed, has_collided
        beq $t4, DPurple, has_collided
        lw $t4, 260($t3) #Check unit 6
        beq $t4, DRed, has_collided
        beq $t4, DPurple, has_collided
fc_ret: beq $s7, 1, w_p3
	j loop3
        
        
has_collided: #The player has collided
        addi $v1, $v1, -1
        addi $s2, $v1, 0
        beq $s2, 2, health_loss
	beq $s2, 1, health_loss
        ble $v1, 0, fc_ret 	#if health is less than or equal to 0
        j redraw_all
	

redraw_all:
	jal delete_all
	
	li $t0, BASE_ADDRESS
	#Initialize Player
	li $t2, Blue		#Blue 
	li $t1, Purple  	#Purple
        li $t3, Yellow 		#Yellow
	sw $t3, 4148($t0)	#Head
	sw $t1, 4272($t0)
	sw $t2, 4276($t0)
	sw $t1, 4280($t0)
	sw $t2, 4400($t0)	#Tail
	sw $t2, 4408($t0)	#Tail
	la $t4, player
        addi $t5, $gp, 4148
        sw $t5, 0($t4) 		#Unit 1, Head
        addi $t5, $gp, 4272
        sw $t5, 4($t4) 		#Unit 2, Left Purple
        addi $t5, $gp, 4276
        sw $t5, 8($t4) 		#Unit 3, Centre Blue
        addi $t5, $gp, 4280
        sw $t5, 12($t4) 	#Unit 4, RIght Purple
        addi $t5, $gp, 4400
        sw $t5, 16($t4) 	#Unit 5, Tail Left
        addi $t5, $gp, 4408
        sw $t5, 20($t4) 	#Unit 6, Tail Right
	
	#Redraw Platform_6
	li $t1, White		#White 
	sw $t1, 5776($t0)
	sw $t1, 5780($t0)
	sw $t1, 5784($t0)
	sw $t1, 5788($t0)
	sw $t1, 5792($t0)
	sw $t1, 5796($t0)
	la $t4, platform_6
	addi $t5, $gp, 5776
        sw $t5, 0($t4) 		#Unit 1
        addi $t5, $gp, 5780
        sw $t5, 4($t4) 		#Unit 2 
        addi $t5, $gp, 5784
        sw $t5, 8($t4) 		#Unit 3
        addi $t5, $gp, 5788
        sw $t5, 12($t4) 	#Unit 4
        addi $t5, $gp, 5792
        sw $t5, 16($t4) 	#Unit 5
        addi $t5, $gp, 5796
        sw $t5, 20($t4) 	#Unit 6
	
	#Redraw Platform_8
	sw $t1, 4520($t0)
	sw $t1, 4524($t0)
	sw $t1, 4528($t0)
	sw $t1, 4532($t0)
	sw $t1, 4536($t0)
	sw $t1, 4540($t0)
	sw $t1, 4544($t0)
	sw $t1, 4548($t0)
	la $t4, platform_8
	addi $t5, $gp, 4520
        sw $t5, 0($t4) 		#Unit 1
        addi $t5, $gp, 4524
        sw $t5, 4($t4) 		#Unit 2
        addi $t5, $gp, 4528
        sw $t5, 8($t4) 		#Unit 3
        addi $t5, $gp, 4532
        sw $t5, 12($t4) 	#Unit 4
        addi $t5, $gp, 4536
        sw $t5, 16($t4) 	#Unit 5
        addi $t5, $gp, 4540
        sw $t5, 20($t4) 	#Unit 6
        addi $t5, $gp, 4544
        sw $t5, 24($t4) 	#Unit 7
        addi $t5, $gp, 4548
        sw $t5, 28($t4) 	#Unit 8
        
        #Initialize Platform_7
	sw $t1, 6500($t0)
	sw $t1, 6504($t0)
	sw $t1, 6508($t0)
	sw $t1, 6512($t0)
	sw $t1, 6516($t0)
	sw $t1, 6520($t0)
	sw $t1, 6524($t0)
	la $t4, platform_7
	addi $t5, $gp, 6500
        sw $t5, 0($t4) 		#Unit 1
        addi $t5, $gp, 6504
        sw $t5, 4($t4) 		#Unit 2
        addi $t5, $gp, 6508
        sw $t5, 8($t4) 		#Unit 3
        addi $t5, $gp, 6512
        sw $t5, 12($t4) 	#Unit 4
        addi $t5, $gp, 6516
        sw $t5, 16($t4) 	#Unit 5
        addi $t5, $gp, 6520
        sw $t5, 20($t4) 	#Unit 6
        addi $t5, $gp, 6524
        sw $t5, 24($t4) 	#Unit 7
	
	#Redraw Platform_3
	sw $t1, 3280($t0)
	sw $t1, 3284($t0)
	sw $t1, 3288($t0)
	la $t4, platform_3
	addi $t5, $gp, 3280
        sw $t5, 0($t4) 		#Unit 1
        addi $t5, $gp, 3284
        sw $t5, 4($t4) 		#Unit 2, 
        addi $t5, $gp, 3288
        sw $t5, 8($t4) 		#Unit 3
        
        #Initialize obstacle_s
        la $t4, obstacle_sq
        li $t2, DRed		#Dark Red 
	li $t1, DPurple  	#Dark Purple        				
        sw $t1, 4048($t0)
        sw $t2, 4052($t0)
        sw $t2, 4176($t0)
        sw $t1, 4180($t0)
        addi $t5, $gp, 4048
        sw $t5, 0($t4) 		#Unit 1, Top Left
        addi $t5, $gp, 4052
        sw $t5, 4($t4) 		#Unit 2, Top Right
        addi $t5, $gp, 4176
        sw $t5, 8($t4) 		#Unit 3, Bottom Left
        addi $t5, $gp, 4180
        sw $t5, 12($t4) 	#Unit 4, Bottom Right
        
        #Initialize obstacle_sq	
        la $t4, obstacle_s
        li $t2, DRed		#Dark Red 
	li $t1, DPurple  	#Dark Purple        				
        sw $t2, 640($t0)
        sw $t1, 644($t0)
        sw $t2, 648($t0)
        sw $t2	, 772($t0)
        addi $t5, $gp, 640
        sw $t5, 0($t4) 		#Unit 1, Top Left
        addi $t5, $gp, 644
        sw $t5, 4($t4) 		#Unit 2, Top Middle
        addi $t5, $gp, 648
        sw $t5, 8($t4) 		#Unit 3, Top Left
        addi $t5, $gp, 772
        sw $t5, 12($t4) 	#Unit 4, Bottom 
        
        #redraw obstacle_sq2
        la $t4, obstacle_sq2
        li $t2, DRed		#Dark Red 
	li $t1, DPurple  	#Dark Purple        				
        sw $t1, 1940($t0)
        sw $t2, 1944($t0)
        sw $t2, 2068($t0)
        sw $t1, 2072($t0)
        addi $t5, $gp, 1940
        sw $t5, 0($t4) 		#Unit 1, Top Left
        addi $t5, $gp, 1944
        sw $t5, 4($t4) 		#Unit 2, Top Middle
        addi $t5, $gp, 2068
        sw $t5, 8($t4) 		#Unit 3, Top Left
        addi $t5, $gp, 2072
        sw $t5, 12($t4) 	#Unit 4, Bottom 
        
        li $s7, 0
	j fc_ret



#################################################
# This section is the gravity() function
# void gravity(int[] player)
#################################################

gravity:

	li $t7, Blue		#Blue 
	li $t8, Purple  	#Purple
        li $t9, Yellow 		#Yellow
        
        lw $t0, 16($a3) #5th unit
        addi $t0, $t0, 128
        lw $t6, 0($t0)
        beq $t6, White, grav_rs_with_jflag	#If floor right beneath is a platform, then no more gravity
        beq $t6, Red, game_over			#If floor right beneath is a the bottom most, then game over
        lw $t0, 20($a3) #6th unit
        addi $t0, $t0, 128
        lw $t6, 0($t0)
        beq $t6, White, grav_rs_with_jflag	#If floor right beneath is a platform, then no more gravity
        beq $t6, Red, game_over			#If floor right beneath is a the bottom most, then game over
        
        li $v0, 32
        #add $a0, $s3, $zero
        li $a0, 40
        syscall
        
	lw $t0, 0($a3)  #1st unit
	sw $zero, 0($t0)
	addi $t0, $t0, 128
        sw $t9, 0($t0)
        sw $t0, 0($a3)
        lw $t0, 4($a3) #2nd unit
        sw $zero, 0($t0)
        addi $t0, $t0, 128
        sw $t8, 0($t0)
        sw $t0, 4($a3)
        lw $t0, 8($a3) #3rd unit
        addi $t0, $t0, 128
        sw $t7, 0($t0)
        sw $t0, 8($a3)
        lw $t0, 12($a3) #4th unit
        sw $zero, 0($t0)
        addi $t0, $t0, 128
        sw $t8, 0($t0)
        sw $t0, 12($a3)
        lw $t0, 16($a3) #5th unit
        addi $t0, $t0, 128
        sw $t7, 0($t0)
        sw $t0, 16($a3)
        lw $t0, 20($a3) #6th unit
        addi $t0, $t0, 128
        sw $t7, 0($t0)
        sw $t0, 20($a3)
        j grav_rs

	
grav_rs:
	jr $ra
	
grav_rs_with_jflag:
	li $s6, 0
	jr $ra
	

#################################################
health_loss:
	sw $zero, 7720($gp) #Health 1
        sw $zero, 7728($gp)
        sw $zero, 7852($gp)
        beq $s2, 2, health_rs
        sw $zero, 7704($gp) #Health 2
        sw $zero, 7712($gp)
        sw $zero, 7836($gp)
        beq $s2, 1, health_rs
        sw $zero, 7688($gp) #Health 3
        sw $zero, 7696($gp)
        sw $zero, 7820($gp) 
        
health_rs:
	j redraw_all
	jr $ra

##################################################
# This function print "GAME OVER"
# void gameover()
####################################################

game_over:
	jal delete_all
	
	sw $zero, 7720($gp) #Health 1
        sw $zero, 7728($gp)
        sw $zero, 7852($gp)
        sw $zero, 7704($gp) #Health 2
        sw $zero, 7712($gp)
        sw $zero, 7836($gp)
        sw $zero, 7688($gp) #Health 3
        sw $zero, 7696($gp)
        sw $zero, 7820($gp) 
        
        
        
        j Refresh
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
			

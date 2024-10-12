x = zeros(1,262144);
x(1) = 0.462;
for i = 2:numel(x)
     x(i) = x(i-1)*(7.828/(2*pi))*sin(2*pi*x(i-1))+sin(3.8135*x(i-1)*(1-x(i-1)));
end
   key=input("enter key: ");
   num_bits_to_store= key;
   masked_image1=imread("message.png");
   

min_position = 1;  
max_position = numel(masked_image1);  
x_normalized = round((x-min(x))/(max(x)-min(x))*(max_position-min_position)+min_position);

encrypted_bits = '';
for i = 1:(num_bits_to_store/2)
    bit_7 = bitget(masked_image1(x_normalized(i)), 7);
    bit_8 = bitget(masked_image1(x_normalized(i)), 8);
    encrypted_bits = strcat(encrypted_bits, num2str(bit_7), num2str(bit_8));
end

encrypted_message_binary = reshape(encrypted_bits, 8, []).';
encrypted_message = char(bin2dec(encrypted_message_binary)).';

disp('Decrypted Message:');
disp(encrypted_message);

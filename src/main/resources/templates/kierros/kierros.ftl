			<table>
				<thead>
				<#--  
					<th scope="col" style="width:50%" >etuysi</th>
					<th scope="col" style="width:50%" >takaysi</th>
				--> 
				</thead>
				<tbody>
					<tr style="vertical-align:top">
 
					<td> <#-- etuysi -->
						<table class="rako">
							<thead>
								<th scope="col" style="width:40%">reikä</th>
								<th scope="col" style="width:30%">lyönnit</th>
								<th scope="col" style="width:30%">pisteet</th>
							</thead>
							<tbody>
								<tr>
									<td>1.</td>
									<td>
										<input type='text' maxlength='2' class='num' name='h1' id='h1' onkeyup="seuraava(event, 'h2')" <#if (kierros.h1)??> value='${kierros.h1}' </#if> >
										</td>
									<td>
										<input type='text' tabindex='-1' class='info'  name='p1' id='p1' readonly <#if (kierros.p1)??> value='${kierros.p1}' </#if> >
									</td>
								</tr>
								<tr>
									<td>2.</td>
									<td>
										<input type='text' maxlength='2' class='num' name='h2' id='h2' onkeyup="seuraava(event, 'h3')" <#if (kierros.h2)??> value='${kierros.h2}' </#if> ></td>
									<td>
										<input type='text' tabindex='-1' class='info'  name='p2' id='p2' readonly <#if (kierros.p2)??> value='${kierros.p2}' </#if> >
									</td>
								</tr>
								<tr>
									<td>3.</td>
									<td>
										<input type='text' maxlength='2' class='num' name='h3' id='h3' onkeyup="seuraava(event, 'h4')" <#if (kierros.h3)??> value='${kierros.h3}' </#if> ></td>
									<td>
										<input type='text' tabindex='-1' class='info'  name='p3' id='p3' readonly <#if (kierros.p3)??> value='${kierros.p3}' </#if> >
									</td>
								</tr>
								<tr>
									<td>4.</td>
									<td>
										<input type='text' maxlength='2' class='num' name='h4' id='h4' onkeyup="seuraava(event, 'h5')" <#if (kierros.h4)??> value='${kierros.h4}' </#if> ></td>
									<td>
										<input type='text' tabindex='-1' class='info'  name='p4' id='p4' readonly <#if (kierros.p4)??> value='${kierros.p4}' </#if> >
									</td>
								</tr>
								<tr>
									<td>5.</td>
									<td>
										<input type='text' maxlength='2' class='num' name='h5' id='h5' onkeyup="seuraava(event, 'h6')" <#if (kierros.h5)??> value='${kierros.h5}' </#if> ></td>
									<td>
										<input type='text' tabindex='-1' class='info'  name='p5' id='p5' readonly <#if (kierros.p5)??> value='${kierros.p5}' </#if> >
									</td>
								</tr>
								<tr>
									<td>6.</td>
									<td>
										<input type='text' maxlength='2' class='num' name='h6' id='h6' onkeyup="seuraava(event, 'h7')" <#if (kierros.h6)??> value='${kierros.h6}' </#if> ></td>
									<td>
										<input type='text' tabindex='-1' class='info'  name='p6' id='p6' readonly <#if (kierros.p6)??> value='${kierros.p6}' </#if> >
									</td>
								</tr>
								<tr>
									<td>7.</td>
									<td>
										<input type='text' maxlength='2' class='num' name='h7' id='h7' onkeyup="seuraava(event, 'h8')" <#if (kierros.h7)??> value='${kierros.h7}' </#if> ></td>
									<td>
										<input type='text' tabindex='-1' class='info'  name='p7' id='p7' readonly <#if (kierros.p7)??> value='${kierros.p7}' </#if> >
									</td>
								</tr>
								<tr>
									<td>8.</td>
									<td>
										<input type='text' maxlength='2' class='num' name='h8' id='h8' onkeyup="seuraava(event, 'h9')" <#if (kierros.h8)??> value='${kierros.h8}' </#if> ></td>
									<td>
										<input type='text' tabindex='-1' class='info'  name='p8' id='p8' readonly <#if (kierros.p8)??> value='${kierros.p8}' </#if> >
									</td>
								</tr>
								<tr>
									<td>9.</td>
									<td>
										<input type='text' maxlength='2' class='num' name='h9' id='h9' onkeyup="seuraava(event, 'h10')" <#if (kierros.h9)??> value='${kierros.h9}' </#if> ></td>
									<td>
										<input type='text' tabindex='-1' class='info'  name='p9' id='p9' readonly <#if (kierros.p9)??> value='${kierros.p9}' </#if> >
									</td>
								</tr>
								<tr>
									<td>1-9</td>
									<td>
										<input type='text' maxlength='3' tabindex='-1' class='num' name='hout' id='hout' readonly <#if (kierros.hout)??> value='${kierros.hout}' </#if> ></td>
									<td>
										<input type='text' maxlength='3' tabindex='-1' class='info' name='p_out' id='p_out' readonly <#if (kierros.p_out)??> value='${kierros.p_out}' </#if> >
									</td>
								</tr>
							</tbody>
						</table>
					</td>
		
					<td> <#-- takaysi -->
						<table class="rako">
							<thead>
								<th scope="col" style="width:40%">reikä</th>
								<th scope="col" style="width:30%">lyönnit</th>
								<th scope="col" style="width:30%">pisteet</th>
							</thead>
							<tbody>
								<tr>
									<td>10.</td>
									<td>
										<input type='text' maxlength='2' class='num' name='h10' id='h10' onkeyup="seuraava(event, 'h11')" <#if (kierros.h10)??> value='${kierros.h10}' </#if> ></td>
									<td>
										<input type='text' tabindex='-1' class='info'  name='p10' id='p10' readonly <#if (kierros.p10)??> value='${kierros.p10}' </#if> >
									</td>
								</tr>
								<tr>
									<td>11.</td>
									<td>
										<input type='text' maxlength='2' class='num' name='h11' id='h11' onkeyup="seuraava(event, 'h12')" <#if (kierros.h11)??> value='${kierros.h11}' </#if> ></td>
									<td>
										<input type='text' tabindex='-1' class='info'  name='p11' id='p11' readonly <#if (kierros.p11)??> value='${kierros.p11}' </#if> >
									</td>
								</tr>
								<tr>
									<td>12.</td>
									<td>
										<input type='text' maxlength='2' class='num' name='h12' id='h12' onkeyup="seuraava(event, 'h13')" <#if (kierros.h12)??> value='${kierros.h12}' </#if> ></td>
									<td>
										<input type='text' tabindex='-1' class='info'  name='p12' id='p12' readonly <#if (kierros.p12)??> value='${kierros.p12}' </#if> >
									</td>
								</tr>
								<tr>
									<td>13.</td>
									<td>
										<input type='text' maxlength='2' class='num' name='h13' id='h13' onkeyup="seuraava(event, 'h14')" <#if (kierros.h13)??> value='${kierros.h13}' </#if> ></td>
									<td>
										<input type='text' tabindex='-1' class='info'  name='p13' id='p13' readonly <#if (kierros.p13)??> value='${kierros.p13}' </#if> >
									</td>
								</tr>
								<tr>
									<td>14.</td>
									<td>
										<input type='text' maxlength='2' class='num' name='h14' id='h14' onkeyup="seuraava(event, 'h15')" <#if (kierros.h14)??> value='${kierros.h14}' </#if> ></td>
									<td>
										<input type='text' tabindex='-1' class='info'  name='p14' id='p14' readonly <#if (kierros.p14)??> value='${kierros.p14}' </#if> >
									</td>
								</tr>
								<tr>
									<td>15.</td>
									<td>
										<input type='text' maxlength='2' class='num' name='h15' id='h15' onkeyup="seuraava(event, 'h16')" <#if (kierros.h15)??> value='${kierros.h15}' </#if> ></td>
									<td>
										<input type='text' tabindex='-1' class='info'  name='p15' id='p15' readonly <#if (kierros.p15)??> value='${kierros.p15}' </#if> >
									</td>
								</tr>
								<tr>
									<td>16.</td>
									<td>
										<input type='text' maxlength='2' class='num' name='h16' id='h16' onkeyup="seuraava(event, 'h17')" <#if (kierros.h16)??> value='${kierros.h16}' </#if> ></td>
									<td>
										<input type='text' tabindex='-1' class='info'  name='p16' id='p16' readonly <#if (kierros.p16)??> value='${kierros.p16}' </#if> >
									</td>
								</tr>
								<tr>
									<td>17.</td>
									<td>
										<input type='text' maxlength='2' class='num' name='h17' id='h17' onkeyup="seuraava(event, 'h18')" <#if (kierros.h17)??> value='${kierros.h17}' </#if> ></td>
									<td>
										<input type='text' tabindex='-1' class='info'  name='p17' id='p17' readonly <#if (kierros.p17)??> value='${kierros.p17}' </#if> >
									</td>
								</tr>
								<tr>
									<td>18.</td>
									<td>
										<input type='text' maxlength='2' class='num' name='h18' id='h18' onkeyup="seuraava(event, 'merkitsija')" <#if (kierros.h18)??> value='${kierros.h18}' </#if> ></td>
									<td>
										<input type='text' tabindex='-1' class='info'  name='p18' id='p18' readonly <#if (kierros.p18)??> value='${kierros.p18}' </#if> >
									</td>
								</tr>
								<tr>
									<td>10-18</td>
									<td>
										<input type='text' maxlength='3' tabindex='-1' class='num' name='hin' id='hin' readonly <#if (kierros.hin)??> value='${kierros.hin}' </#if> ></td>
									<td>
										<input type='text' tabindex='-1' class='info'  name='p_in' id='p_in' readonly <#if (kierros.p_in)??> value='${kierros.p_in}' </#if> >
									</td>
								</tr>
								<tr>
									<td>yhteensä</td>
									<td>
										<input type='text' maxlength='3' tabindex='-1' class='num' name='yhteensa' id='yhteensa' readonly <#if (kierros.yhteensa)??> value='${kierros.yhteensa}' </#if> >
										</td>
									<td>
										<input type='text' tabindex='-1' class='info'  name='p_yht' id='p_yht' readonly <#if (kierros.p_yht)??> value='${kierros.p_yht}' </#if> >
									</td>
								</tr>

							</tbody>
						</table>
					</td>
					</tr>
				</tbody>
			</table>
